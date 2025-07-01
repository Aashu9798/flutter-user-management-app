import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/user_provider.dart';
import '../utils/route_transitions.dart';
import 'add_user_screen.dart';
import 'user_detail_screen.dart';
import '../widgets/user_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUsers().catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            backgroundColor: Colors.red.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Error: ${error.toString()}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    });
  }

  @override
  void didPopNext() {
    // Called when user comes back to this screen
    _searchFocus.unfocus();
  }

  /// this remove focus when returning to this screen
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const desktopBreakpoint = 600.0;
    final provider = Provider.of<UserProvider>(context);
    final users = provider.users;
    final isWide = MediaQuery.of(context).size.width > desktopBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),floatingActionButton: FloatingActionButton.extended(
      icon: const Icon(Icons.add),
      label: const Text('Add New User'),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddUserScreen()),
      ),
    ),
      body: provider.status == Status.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.status == Status.error
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Error Icon with background
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wifi_off,
                  size: 60,
                  color: Colors.redAccent,
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                'No Internet Connection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Error message (can include API error)
              Text(
                provider.error,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 24),

              // Retry Button
              ElevatedButton.icon(
                onPressed: () {
                  provider.fetchUsers();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                focusNode: _searchFocus,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by name or email',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      Provider.of<UserProvider>(context, listen: false)
                          .searchUser('');
                      setState(() {}); // refresh UI to hide icon
                    },
                  )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                onChanged: (value) {
                  Provider.of<UserProvider>(context, listen: false).searchUser(value);
                  setState(() {}); // toggle clear icon visibility
                },
              ),
            ),
          ),
          Expanded(
            child: users.isEmpty
                ? SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon in soft background
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.search_off,
                          size: 48,
                          color: Colors.blue.shade400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No Users Found',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try adjusting your search keywords.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                : isWide
                ? GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserTile(
                  user: user,
                  onTap: () => Navigator.push(
                    context,
                    SmoothPageRoute(UserDetailScreen(user: user)),
                  ),
                );
              },
            )
                : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserTile(
                  user: user,
                  onTap: () =>Navigator.push(
                    context,
                    SmoothPageRoute(UserDetailScreen(user: user)),                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
