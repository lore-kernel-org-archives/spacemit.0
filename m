Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03193243964
	for <spacemit@lists.linux.dev>; Mon,  5 Oct 2026 00:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160858; cv=none; b=dyTcWCWY4oVXVajNy533LH4PvovStFleKmql7/NagHr7nIGxmZ8MyXuJ9jzJ2UccL3OLim98MrNPd8XSko5F81/LYM7QtOlOWBgeC5+kNbwPBXc6PbUW6I95Ix5CpuOf6zqoAwiKHSvnTjJqnX8hAS9N01e/we18b6fNBX6TC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160858; c=relaxed/simple;
	bh=Y0E2g0e1Z7d8skdlfZdfRNWd+wbFF2OigZyuCpVG78o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcXXJuiY00m/rEp7/sJCl9+SB/S9uvXWtORK+0e3t1puTbaNpevUj5x925a1FJs8QrZlffD+fiepn55dtWlX97FuiSjeMXqiwA0e2QJpdT70Ya4ezPOrkhLUrihq3FdLqeTbcbzeIgSfB3gV9totTNwloNJoSFS2h55499r7Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=Nv+XLF3v; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="Nv+XLF3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791160836;
	bh=QLEvGHaVfiQz8fa/G0GAU36A7Zcf4zBqCnZtcMywtuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nv+XLF3vPODlmc6fX/cgp/L1ii00yXX+58i9WwQHVnnKo65E/Zb9GAYRgBE1oVaHw
	 hmLvsVBxPqQqaKicGXiccWtIDRcfbOz1Cmt0VxD7WssebMQSLOGr6gp/uCcImwqg2g
	 D/5bMToMvdmBNUh8ahh5v8vwPz2Ov/P0MQyGs8GVKSpe4wSTwOEvDLUiNsaFTN5jiX
	 DeCJoW26CgA8n5bH21hXI1tJv9wsfATDlDZFf2yVy6qzuU4PcFNHbtzJ9aWo6qMMHY
	 YF7CHwjsw4pRZocM3PIncqYs7Bt+1ouu8pwXmh680RhlwbDo/nI3afF5PyQqlTsY4X
	 kyeC7XwxZSvCA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B3EE0B2200D9;
	Mon,  5 Oct 2026 02:40:34 +0200 (CEST)
Message-ID: <24dbd483-6b93-4d68-ae5b-e61f2af66857@freeshell.de>
Date: Sun, 4 Oct 2026 17:40:27 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] doc: board: spacemit: document the SpacemiT boot
 image format
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Yixun Lan <dlan@kernel.org>,
 Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
References: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
 <20260921-spacemit-aihd-v3-2-f660fc85d2a5@pigmoral.tech>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260921-spacemit-aihd-v3-2-f660fc85d2a5@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Junhui,

On 9/21/26 07:54, Junhui Liu wrote:
> Document the boot image layout shared by the SpacemiT K1 and K3
> BootROMs, including the metadata headers and authentication areas.
> 
> Describe the K3 non-secure CRC32 path supported by mkimage and provide
> an example using the "smtimage" image type with "-n k3".
> 
> Tested-by: E Shattow <e@freeshell.de>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  doc/board/spacemit/index.rst    |   2 +-
>  doc/board/spacemit/smtimage.rst | 143 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/board/spacemit/index.rst b/doc/board/spacemit/index.rst
> index a5e35ee12ab6..5797ada37d15 100644
> --- a/doc/board/spacemit/index.rst
> +++ b/doc/board/spacemit/index.rst
> @@ -7,4 +7,4 @@ SpacemiT
>  
>     bananapi-f3
>     k1-spl
> -
> +   smtimage
> diff --git a/doc/board/spacemit/smtimage.rst b/doc/board/spacemit/smtimage.rst
> new file mode 100644
> index 000000000000..19a5c9972f75
> --- /dev/null
> +++ b/doc/board/spacemit/smtimage.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +SpacemiT boot image format
> +==========================
> +
> +The SpacemiT K1 and K3 BootROMs load a SpacemiT boot image as the first-stage
> +bootloader (FSBL), either from persistent storage or over USB in MaskROM mode.

"BootROM on SpacemiT K1 or K3 System-on-Chip expects the First Stage
BootLoader to be wrapped in a specially constructed image layout." and
delete the unrelated fact about boot flow.

> +
> +Image layout
> +------------
> +
> +K1 and K3 share the same layout. A fixed 4 KiB prefix contains two 32-byte

Delete redundant sentence "K1 and K3 share the same layout", as it is
implied above and cannot be anything else by the later description.


> +metadata headers, key slots, and signature slots. The aligned SPL payload and
> +a trailing authentication area follow::

The architectural reasoning of payload alignment should be part of this
sentence if it is known. From my experience looking at disassembled
BootROM of another SoC there is a trend of structs and string data
sections to be extended to 8-byte alignment (word-aligned for 64-bit
RISC-V); Why would the payload be extended to quad-word alignment, is
this related to the NOR flash page size and/or a cryptography
requirement? Disregard my inquiry here if it is not known the reason for
this.

> +
> +    offset                                    size
> +    0x000  +-------------------------------+
> +           | root RSA-2048 modulus         |  0x100
> +    0x100  +-------------------------------+
> +           | header0                       |  0x020
> +    0x120  +-------------------------------+
> +           | key-selection metadata        |  0x1e0
> +    0x300  +-------------------------------+
> +           | OEM public-key slots          |  0x800
> +    0xb00  +-------------------------------+
> +           | signature0                    |  0x100
> +    0xc00  +-------------------------------+
> +           | reserved                      |  0x3e0
> +    0xfe0  +-------------------------------+
> +           | header1                       |  0x020
> +    0x1000 +-------------------------------+
> +           | SPL payload (32-byte aligned) |

Keep "n-byte" as-is when discussing byte-layout to describe alignment
and not i.e. word or half-word or nibble etc. considering my previous
suggestion.

> +           +-------------------------------+
> +           | signature1                    |  0x100
> +           +-------------------------------+
> +
> +For payload size ``P`` and ``A = ALIGN(P, 32)``, the image size is
> +``0x1000 + A + 0x100``.
> +
> +Metadata header
> +---------------
> +
> +Both header0 and header1 use the following format:
> +
> +.. list-table::
> +   :header-rows: 1
> +
> +   * - Offset
> +     - Size
> +     - Field
> +     - Description
> +   * - 0x00
> +     - 4
> +     - ``magic``
> +     - ``AIHD``
> +   * - 0x04
> +     - 1
> +     - ``version``
> +     - Anti-rollback image version
> +   * - 0x05
> +     - 1
> +     - ``secure``
> +     - Zero selects anti-rollback bank 0
> +
> +       Non-zero selects anti-rollback bank 1
> +   * - 0x06
> +     - 2
> +     - ``reserved``
> +     - Reserved
> +   * - 0x08
> +     - 8
> +     - ``image_size``
> +     - header0: prefix information
> +
> +       header1: aligned payload size
> +   * - 0x10
> +     - 8
> +     - ``load_addr``
> +     - Unused by the common authentication code
> +   * - 0x18
> +     - 4
> +     - ``header_crc``
> +     - K3: CRC32 over header bytes ``[0x00, 0x18)``
> +   * - 0x1c
> +     - 4
> +     - ``image_crc``
> +     - K3: CRC32 over the payload in header1 only
> +
> +``header1.image_size`` records the aligned payload size and therefore
> +determines the location of signature1.
> +
> +Authentication
> +--------------
> +
> +K1 and K3 apply different authentication policies:
> +
> +.. list-table::
> +   :header-rows: 1

The previous list-table of offsets is okay for review and diff output,
however the following list-table is not acceptable.

> +
> +   * - Area
> +     - K1
> +     - K3 non-secure boot mode
> +     - K3 secure boot mode
> +   * - Root and OEM keys
> +     - RSA-2048 moduli with an eFuse root-hash check when secure boot is
> +       enabled
> +     - Unused
> +     - RSA-2048 moduli with an eFuse root-hash check
> +   * - Header CRC
> +     - Not checked separately
> +     - header1 verified
> +
> +       header0 ignored
> +     - Both verified and covered by RSA
> +   * - Image CRC
> +     - Not checked separately
> +     - Payload CRC32 in header1
> +     - Covered by RSA but not checked separately
> +   * - signature0
> +     - Verified with the root key over ``[0x100, 0xb00)``
> +     - Unused
> +     - Verified with the root key over ``[0x100, 0xb00)``

Why the mixed-use of square brackets and parenthesis?

> +   * - signature1
> +     - Verified with the SPL key over header1 and the aligned payload
> +     - Unused
> +     - Verified with the SPL key over header1 and the aligned payload
> +

I don't know what is preferred here by documentation reviewers but this
above list-table is not reviewable as-is. Maybe try to flip the axis, or
split into a series of tables as one-per-name of K1, K3 non-secure boot
mode, and K3 secure boot mode?  The purpose of restructuring this should
be readability before being rendered, and minimal 'diff' impact for
future changes.

> +K1 verifies both signatures even without a programmed root-key hash. In this
> +case, the root key comes from the image and is not authenticated by hardware,
> +so the image, keys, and signatures can be replaced together.
> +
> +K3 uses CRC32 in non-secure boot mode and hardware-rooted RSA in secure boot
> +mode.
> +
> +Creating an image
> +-----------------
> +
> +U-Boot currently creates only K3 images for non-secure boot mode. Package an
> +SPL payload with::
> +
> +    $ tools/mkimage -T smtimage -n k3 -d u-boot-spl.bin FSBL.bin

Use lowercase letters for the output filename if it is not any CONFIG_
symbol or preprocessor define symbol, and re-use an existing filename
stem as for example any of:

u-boot-spl.smtimage
u-boot-spl-mkimage.bin
u-boot-spl.bin.smtimage
spl.bin

A distro package of u-boot or later user of the build system may copy
this output to "FSBL.bin" but that is nothing to do with us here. In
fact for documentation purpose here it is useful to retain "FSBL.bin" as
a distinct description of the vendor firmware SPL and not get this
confused for mainline u-boot.

> +
> +K1 images and RSA-authenticated K3 images are not yet supported.
> 

This statement may be simply deleted. It is obvious that support does
not exist when it is not described here. If you would like to keep this
line it is not any problem. Similarly for the sentence "U-Boot currently
creates only K3 images for non-secure boot mode." which is not really
accurate to say, as there is no makefile target or binman setup for any
of this yet. Technically U-Boot does nothing at all regarding this
documentation. It would just have to be more diff lines to review later
and can be omitted now.

-E
