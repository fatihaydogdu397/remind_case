import 'package:flutter/widgets.dart';
import 'package:re_mind_case/app/enums/billing_type.dart';

// normalde ben provider kullanırken özellikle mvvmi öğrendikten sonra bu şekilde bir base
// oluşturup view ve viewmodelleri bunların üzerine inşa ediyorum providerları get_it paketini kullanarak listeliyorum dolayısıyla mainde multiprovider oluşturup provider listesini çağırmak yerine locator yapısını kullanmış oluyorum mvvm için

class BaseModel extends ChangeNotifier {}
