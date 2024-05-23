import 'package:api_fetching/bloc/bloc/apifetch_bloc.dart';
import 'package:api_fetching/bloc/bloc/cubit/api_cubit.dart';
import 'package:api_fetching/models/model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ApiCubit apifetchBloc = ApiCubit();

  @override
  void initState() {
    context.read<ApifetchBloc>().add(ApifetchInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('fetch Api'),
        ),
        body: Column(
          children: [
            BlocBuilder<ApifetchBloc, ApifetchState>(
              builder: (context, state) {
                print(state);
                if (state is ApiIntialState) {
                  return const Align(
                      alignment: Alignment.center, child: CircularProgressIndicator());
                } else if (state is ApiFetchedState) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(state.holder[index].title.toString()),
                      ),
                      itemCount: state.holder.length,
                    ),
                  );
                } else {
                  return const Text('error');
                }
              },
            ),
            ElevatedButton(
                onPressed: () => {
                      setState(() {
                        context.read<ApifetchBloc>().add(ApiPostResult());
                      })
                    },
                child: const Text('Add'))
          ],
        ));
  }
}
