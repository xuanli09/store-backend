package store.algebra.product.db.entity

import store.algebra.product._
import store.algebra.product.entity.component._

/**
  * @author Daniel Incicau, daniel.incicau@busymachines.com
  * @since 15/08/2018
  */
final case class StoreProductDB(
    productId: ProductID,
    name: String,
    price: Price,
    discount: Discount,
    isAvailableOnCommand: Boolean,
    isFavourite: Boolean,
    description: List[DescParagraph],
    care: List[CareParagraph],
    addedAt: AddedAt,
    category: CategoryDB
)
