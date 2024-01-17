import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';

class ListWhereWatch extends StatefulWidget {
  final List<WatchCountry> listWatch;
  final WatchCountry watchSelect;
  const ListWhereWatch({
    super.key,
    required this.listWatch,
    required this.watchSelect,
  });

  @override
  State<ListWhereWatch> createState() => _ListWhereWatchState();
}

class _ListWhereWatchState extends State<ListWhereWatch> {
  late List<WatchCountry> listWatch;
  late WatchCountry watchSelect;

  @override
  void initState() {
    listWatch = widget.listWatch;
    watchSelect = widget.watchSelect;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Onde assistir',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<WatchCountry>(
                value: watchSelect,
                alignment: Alignment.centerRight,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                items: listWatch
                    .map<DropdownMenuItem<WatchCountry>>(
                      (watch) => DropdownMenuItem(
                        value: watch,
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 200,
                            minWidth: 100,
                          ),
                          child: Text(
                            watch.country.nativeName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    watchSelect = value!;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            watchSelect.buy.isEmpty
                ? Container()
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Comprar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: watchSelect.buy
                              .map(
                                (buy) =>
                                    cardWarch(buy.logoPath, buy.providerName),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
            watchSelect.flatrate.isEmpty
                ? Container()
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Assinar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: watchSelect.flatrate
                              .map(
                                (flatrate) => cardWarch(
                                    flatrate.logoPath, flatrate.providerName),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
            watchSelect.rent.isEmpty
                ? Container()
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Alugar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: watchSelect.rent
                              .map(
                                (rent) =>
                                    cardWarch(rent.logoPath, rent.providerName),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget cardWarch(String logo, String name) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Tooltip(
          message: name,
          triggerMode: TooltipTriggerMode.tap,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              logo,
              height: 50,
              width: 50,
            ),
          ),
        )
      ],
    );
  }
}
