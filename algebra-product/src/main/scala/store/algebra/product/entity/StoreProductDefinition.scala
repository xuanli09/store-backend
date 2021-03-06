package store.algebra.product.entity

import store.algebra.content.entity.Content
import store.algebra.product._
import store.algebra.product.entity.component._

/**
  * @author Daniel Incicau, daniel.incicau@busymachines.com
  * @since 15/08/2018
  */
final case class StoreProductDefinition(
    categoryId: CategoryID,
    name: String,
    images: List[Content],
    stocks: List[Stock],
    price: Price,
    discount: Discount,
    isAvailableOnCommand: Boolean,
    isFavourite: Boolean,
    description: List[DescParagraph],
    care: List[CareParagraph]
) extends Serializable
