import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/task_data_bloc.dart';
import 'package:task/model/model.dart';

class RatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6ae792),
        title: Text('Rate'),
      ),
      body: BlocProvider(
        create: (context) => RateBloc()..fetchCurrencies(),
        child: RateList(),
      ),
    );
  }
}

class RateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateBloc, List<Rate>>(
      builder: (context, rates) {
        return ListView.builder(
          itemCount: rates.length,
          itemBuilder: (context, index) {
            final rate = rates[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff6ae792),
                  child: Text(
                    rate.currencySymbol??"",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(
                  rate.id??"",
                ),
                subtitle: Text(rate.rateUsd.toString()),
                
              ),
            );
            
          },
        );
      },
    );
  }
}
