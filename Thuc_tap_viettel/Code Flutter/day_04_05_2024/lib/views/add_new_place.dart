import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place.dart';
import '../provider/id_provider.dart';
import '../provider/place_provider.dart';

class AddNewPlace extends ConsumerStatefulWidget{
  const AddNewPlace({super.key, this.place, this.index,this.type });
  final Place? place;
  final int? index;
  final String? type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddNewPlaceState();
}

class AddNewPlaceState extends ConsumerState<AddNewPlace> {
  TextEditingController? idController;
  TextEditingController? nameController;
  TextEditingController? addressController;
  TextEditingController? descriptionController;
  late bool isValidId ;
  late List<Place> places;
  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    descriptionController = TextEditingController();
    isValidId = true;
    if(widget.type == "add" ){
      idController!.clear();
      nameController!.clear();
      addressController!.clear();
      descriptionController!.clear();
    }else{
      idController!.text =widget.place!.id;
      nameController!.text = widget.place!.namePlace;
      addressController!.text = widget.place!.address;
      descriptionController!.text = widget.place!.description;
    }
  }

  @override
  void dispose() {
    super.dispose();
    idController!.dispose();
    nameController!.dispose();
    addressController!.dispose();
    descriptionController!.dispose();
  }


  @override
  Widget build(BuildContext context) {

    isValidId =  ref.watch(idProvider);
    places = ref.watch(placeProvider);

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: widget.place == null
                ? const Text("Add new Place",style: TextStyle(color: Colors.white))
                : const Text("Edit Place",style: TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                        errorText: isValidId ? null :"Id was exited",
                        labelText: "Id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                  const SizedBox(height: 12,),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                  const SizedBox(height: 12,),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                  const SizedBox(height: 12,),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                      onPressed: () async {
                       await ref.read(idProvider.notifier).checkValidId(idController!.text.trim(), places);
                        print('IsValid : $isValidId');
                       Future.delayed(const Duration(seconds: 1),() {
                         print('IsValid : $isValidId');
                         if(isValidId){
                           Place newPlace = Place(
                               id:idController!.text ,
                               namePlace: nameController!.text,
                               address: addressController!.text,
                               description: descriptionController!.text);

                           if(widget.place != null){
                             ref.read(placeProvider.notifier).updatePlace(widget.index!, newPlace);
                           }else{
                             ref.read(placeProvider.notifier).createPlace(newPlace);
                           }
                           Navigator.of(context).pop();
                         }
                       },);

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child:widget.place == null ? const Text("Add") : const Text("Update")
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}