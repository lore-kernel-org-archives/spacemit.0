Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27334BA3B
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759025177; cv=none; b=MejdUcoWpUjaHqJ/HobIdqcr0r18qXofFDnDbHLfVAstY9BYkaW1r8yfQblZwh6j6X4vSIyJCgOU5MPDbahcR+cr3wBYsMR+ZKnfIGs5GWa2KloNVQ1y/+wnFHhAB0rVtGXTrOESjNpPnbkcr7CWihLs/FJlAKlwv/2pQolBFoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759025177; c=relaxed/simple;
	bh=dd8aTFM2Eb5B8r1iK/jAwaTrG7N7Mae22af5ILS5Ej8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1TMEnnppYle7bvbDzrfSvIlOndEuqs4jHPGxY5GQn4pe7yPRMxzKUDz/GcOAB27uFLXkuvFsmqUjwCM6HwSYh5fOsDsXu9Gb5s3u/dIfDWAHXdm6Nmc+x/mPvaBWwzQIwOIblKCsAer0MQ7AmgfvP2Kk/Y/EetmTd7NIgDwc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XwNUjyHV; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XwNUjyHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025079;
	bh=m9Kk7QA8lWfdkzkFV5B/KM9BWqdwJsdsHEE8+TGRrrM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=XwNUjyHVA5k32M95YQy28JjhMeaiz+GPu5bSxH6+lgtKwbvte3D2mUezhprlpXDd6
	 6DjfWyoxKA8sI64pKNTzLWGiD12+94LDll+/a7bUbvxnhmsey3+H3hK9kuD9IhZf8y
	 XHTT0vqjmPqsyQU9Bp3byH6tVyQxXVQ0lYquP3VY=
X-QQ-mid: esmtpsz20t1759025076t46662b3f
X-QQ-Originating-IP: lQaZvluawJANmPALLJ4FldAi7OUDYe5AwRXmjd29L0E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:04:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14352669615158593729
EX-QQ-RecipientCnt: 14
Date: Sun, 28 Sep 2025 10:04:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <20B16B97E8F735FE+aNiXswZes4EM2abP@kernel.org>
References: <20250926175833.3048516-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926175833.3048516-1-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Np+AlqyfvJHVjdiv9C0AC+qoI1zC1eunAQA7z2Op1WX2Pl2k2Q5I9lJt
	Zl87eI//T6L2ScBJVj4E9hokwiwY7DxUOD9DoOLqpDG1DRWdYt/tH8VWtgSwYccZ3YOcMIf
	injPQe1AzZ7zSV8YWEJ3Qs6EAoAEZXIknSEUohk+8oru2B994inkL97ln58Xcw5X6nQ3946
	T7qX2eeSpYeTFjnvdbTkuTWEsBFNd9dk8CDkL3XlAebeAaguBHfZ4/f+ij8EkaQ86APtGiQ
	PaNcBNSCl47kGbIFygHmNo/HUTLTd/QqJ/SinTTl9p17WvV17YZkY+6N3xZLWB56x4pn88J
	3DZkRdb8cVZVvgyB4A7j4TPTnlVfFmU/Vv9BkM41/ASAuGZajSeQuMuE+eGRyRHeCE5Bt6o
	OtShy8u8P3+u0E7iufjcW94ZSWSFwpxj6JNK29ZLNDDtRCviccKAVoo+m4BuzlPCO5djZ/E
	uEpXl//XbwfHVJtDw8WkZB+bQqhxUrTjloq5gArHUHYEDbAVKXl/Ris0GZyggxotBmWfWZl
	ZDBi2lmLSssTNY1RnHs1uZHocV3B0qbXWZ+D+oSxOYpe2w4SmgU7ahg88dHxqH/Of9wIHVI
	0IaIMeefWsVuAehLJndLLR4z+7J6v2d1AO7tpaSatj9nhTdlgPz/t9WCMWZ+Sar6TK5aEbj
	kr/zcg+iiMMa4e1brQaGczhjJ0FUv6aDg4UHoHYeqgS+0Pe3bF27WfKdq35Zj1pScJQ1+xZ
	mTP8DraNgoATtN+BO78h0aFV6VW7DqpuCRlvFLX7Dm/zYv+JOdrszfpeAsSF7KbnruZsZUS
	2ojY5Xg+Gl4sRcDDDEVT1Mw8OhLVh7V+UQhVN/8ZOGZN3gqsiM5eHJcmPGN3N8RiCDF23FP
	WJnMf/NEPsoUz9AeH7f7G4E8KH//dQWp/mows1eP/18Fq3Uj3L7q24HDI26XrlGOSQiE+/X
	Sv9+ftOsOHIkHx6Z+Q+iiYYsSb+AIRFiH/Wbq0sTXKXOlHPaJZQTKN1C+9UWxkbY8CRUqlN
	3xzHA3+e5oSO/KwDgZpZfGYIHtTqaL3ocSGwWtIT2u6iOsFXfvToLgls+LvuicuzAwxclNg
	ndyhijiibV4
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Fri, Sep 26, 2025 at 07:54:36PM +0200, Aurelien Jarno wrote:
> The BPI-F3 board has a 24c02 eeprom connected to the i2c bus #2. It
> holds board data. This patchset adds support for it.
> 
> Changes between version 2 and version 3:
>   
> - Revert the name change for i2c2-0-cfg and i2c2-0-pins, the second cell
>   is not a function number, but an index.
> 
> Here is version 2 of this series:
>   https://lore.kernel.org/lkml/20250923205028.2355244-1-aurelien@aurel32.net/  
> 
> Changes between version 1 and version 2:
>  - Rename i2c2-0-cfg and i2c2-0-pins into i2c2-4-cfg and i2c2-4-pins to match
>    the naming convention encoding the function number in the second cell.
>  - Rename the 24c02 supply name label to buck3_1v8
>  - Add a onie,tlv-layout nvmem layout describing the content of the 24c02 eeprom
> 
> Here is version 1 of this series:
>   https://lore.kernel.org/lkml/20250921210237.943370-1-aurelien@aurel32.net/
> 
> 
> Aurelien Jarno (3):
>   riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
>   riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
>   riscv: dts: spacemit: add i2c aliases on BPI-F3
> 
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      | 33 ++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 13 ++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
