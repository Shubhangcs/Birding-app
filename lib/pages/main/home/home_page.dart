import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_bloc/search_bloc.dart';

class HomePage extends StatefulWidget {
  final Bloc searchBloc;
  const HomePage({super.key, required this.searchBloc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40A858),
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
        actions: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearch(searchBloc: widget.searchBloc),
                  );
                },
                icon: const Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              );
            },
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF40A858),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final List responses = ["Bhavani", "Bhandari", "Sumith"];
  final dynamic searchBloc;
  CustomSearch({required this.searchBloc});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      searchBloc.add(HomePageSearchDataEvent(query: query));
    }
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: (state is HomePageSearchDataFetchState)
                  ? Text(state.data[index])
                  : null,
              trailing: const Icon(Icons.arrow_outward_rounded),
            );
          },
          itemCount:
              (state is HomePageSearchDataFetchState) ? state.data.length : 0,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      searchBloc.add(HomePageSearchDataEvent(query: query));
    }
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: (state is HomePageSearchDataFetchState)
                  ? Text(state.data[index])
                  : null,
              trailing: const Icon(Icons.arrow_outward_rounded),
            );
          },
          itemCount:
              (state is HomePageSearchDataFetchState) ? state.data.length : 0,
        );
      },
    );
  }
}
