import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class SearchActionBar extends StatelessWidget {
  const SearchActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<DictionaryBloc, DictionaryState>(
            builder: (context, state) {
              return TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: tr.app.searchHint,
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) => context
                    .read<DictionaryBloc>()
                    .add(DictionaryQueryChanged(value)),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  context.read<DictionaryBloc>().add(
                        SearchSubmitted(value),
                      );
                },
                textInputAction: TextInputAction.search,
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        BlocBuilder<DictionaryBloc, DictionaryState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<DictionaryBloc>().add(
                      SearchSubmitted(state.stateData.currentQuery),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(14),
              ),
              child: const Icon(Icons.arrow_forward),
            );
          },
        ),
      ],
    );
  }
}
