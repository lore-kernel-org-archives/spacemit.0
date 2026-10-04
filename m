Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A53233126
	for <spacemit@lists.linux.dev>; Sun,  4 Oct 2026 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791155798; cv=none; b=SgxpAa4RQ3rmMwyaVroTnyjxrIKus3DtRO7JzZ/+d7ZMtzE6bWBqzVrvQ2JiG1YeZQO2JTPJj0ey+bNVnJ/jK64X63M7kGVcIUDF/23TjBVUoN7MsnKs2UdB9EEXv59JsmjIfs4B2KgrFv55G1SPUtlWo9CMcjCQvrMd8fdNDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791155798; c=relaxed/simple;
	bh=371PLY4thlhAb3RHRGA90mAXvatE0ptx9GJggVYc7ac=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hk23kpvjmqVrGuqouYys/ZvTY5JKWecxNhOmeI1WWPk7zOavBa7ugd56EEE4S/EDlDAlo7r7zNJNlMtb5ktVdAwRStC1+eyYM0ccpgH3frBoNdzB0i/m4WLDDVmUvDEnaIpyfbWWNNBf1Pd9PQUFkajAQOvbSBsgSEQZr2BZMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=d7Z7WD90; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="d7Z7WD90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791155776;
	bh=tCRrkjD7JeKhuhyfwNlxpP11TqUDJ/PCc8cpIjEO8s8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=d7Z7WD90F9CjzyJDdXKnEWDYowjpagDmHISxfD4SIozCuMlpCCxZ8lmWEg1qGZS7d
	 JcyvLbEMzx8lRdUAFik96U5cJGocIlb9HA+rskDsDBNwJRzbpV+keBqW0jfz8mlw6k
	 cUfjnYzvr8IwsGND7dr4c+ujl69/TPgzC1xcUIFjU7FMpe5wXHr6JnLQWS55fvQ8am
	 reIh5shYz3QkhvZuHvyHDtc4HM6H4v6uZOYN553xkNvq04Rubxuav5wEeHQJB8qnbQ
	 JIWC5ySN+xHoiPO9FMIqiZuqAdkNWXgOyr/TMZe7y4S2vMJfnDxzxo6iAA+k3TGnim
	 0NKy7CuxanNNw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7E981B2204F9;
	Mon,  5 Oct 2026 01:16:14 +0200 (CEST)
Message-ID: <c20b8c2c-4f50-47e7-88fb-8305319d5a52@freeshell.de>
Date: Sun, 4 Oct 2026 16:16:07 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] doc: board: spacemit: document the SpacemiT boot
 image format
From: E Shattow <e@freeshell.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Yixun Lan <dlan@kernel.org>,
 spacemit@lists.linux.dev
References: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
 <20260909-spacemit-aihd-v2-2-780e98cf2fec@pigmoral.tech>
 <95e17452-4f40-4e1e-96b5-3c83f4389005@freeshell.de>
Content-Language: en-US
In-Reply-To: <95e17452-4f40-4e1e-96b5-3c83f4389005@freeshell.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/4/26 14:22, E Shattow wrote:
> Hi Junhui,
> 
> On 9/9/26 08:51, Junhui Liu wrote:
>> Document the boot image layout shared by the SpacemiT K1 and K3
>> BootROMs, including the metadata headers and authentication areas.
>>
>> Describe the K3 non-secure CRC32 path supported by mkimage and provide
>> an example using the "smtimage" image type with "-n k3".
>>
>> Tested-by: E Shattow <e@freeshell.de>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  doc/board/spacemit/index.rst    |   2 +-
>>  doc/board/spacemit/smtimage.rst | 143 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 144 insertions(+), 1 deletion(-)
>>
>> diff --git a/doc/board/spacemit/index.rst b/doc/board/spacemit/index.rst
>> index a5e35ee12ab6..5797ada37d15 100644
>> --- a/doc/board/spacemit/index.rst
>> +++ b/doc/board/spacemit/index.rst
>> @@ -7,4 +7,4 @@ SpacemiT
>>  
>>     bananapi-f3
>>     k1-spl
>> -
>> +   smtimage
>> diff --git a/doc/board/spacemit/smtimage.rst b/doc/board/spacemit/smtimage.rst
>> new file mode 100644
>> index 000000000000..edcc3091e8e7
>> --- /dev/null
>> +++ b/doc/board/spacemit/smtimage.rst
>> @@ -0,0 +1,143 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +SpacemiT boot image format
>> +=========================
>> +
>> +The SpacemiT K1 and K3 BootROMs load a SpacemiT boot image as the first-stage
>> +bootloader (FSBL), either from persistent storage or over USB in MaskROM mode.
> 
> Introduce the topic of SpacemiT boot image format without the unrelated
> boot flow. If the BootROM of both K1 and K3 are identical then use "K1
> and K3", else if they are distinct and being described sharing the same
> data structure format as input then use "K1 or K3".
> 
> Try instead, "BootROM on SpacemiT K1 or K3 System-on-Chip expects the
> First Stage BootLoader to be wrapped in a specially constructed image
> layout."
> 
>> +
>> +Image layout
>> +------------
>> +
>> +K1 and K3 share the same layout. A fixed 4 KiB prefix contains two 32-byte
> 
> Drop the redundant sentence "K1 and K3 share the same layout", as it is
> implied above and cannot be anything else by the later description.
> 
>> +metadata headers, key slots, and signature slots. The aligned SPL payload and
> 
> The reasoning of alignment should be written if it is known, by changing
> "The aligned SPL payload" to e.g. "The word-aligned SPL payload" or "The
> half-word aligned SPL payload" or "The nibble-aligned SPL payload" etc.
> whatever that is actually, or disregard my suggestion here if it is not
> known the reason for this.
> 
>> +a trailing authentication area follow::
>> +
>> +    offset                                    size
>> +    0x000  +-------------------------------+
>> +           | root RSA-2048 modulus         |  0x100
>> +    0x100  +-------------------------------+
>> +           | header0                       |  0x020
>> +    0x120  +-------------------------------+
>> +           | key-selection metadata        |  0x1e0
>> +    0x300  +-------------------------------+
>> +           | OEM public-key slots          |  0x800
>> +    0xb00  +-------------------------------+
>> +           | signature0                    |  0x100
>> +    0xc00  +-------------------------------+
>> +           | reserved                      |  0x3e0
>> +    0xfe0  +-------------------------------+
>> +           | header1                       |  0x020
>> +    0x1000 +-------------------------------+
>> +           | SPL payload (32-byte aligned) |
> 
> Keep as-is when discussing byte-layout to describe alignment as "n-byte"
> and not word or half-word or nibble etc. when considering my previous
> suggestion, FYI.
> 
>> +           +-------------------------------+
>> +           | signature1                    |  0x100
>> +           +-------------------------------+
>> +
>> +For payload size ``P`` and ``A = ALIGN(P, 32)``, the image size is
>> +``0x1000 + A + 0x100``.
>> +
>> +Metadata header
>> +---------------
>> +
>> +Both header0 and header1 use the following format:
>> +
>> +.. list-table::
>> +   :header-rows: 1
>> +
>> +   * - Offset
>> +     - Size
>> +     - Field
>> +     - Description
>> +   * - 0x00
>> +     - 4
>> +     - ``magic``
>> +     - ``AIHD``
>> +   * - 0x04
>> +     - 1
>> +     - ``version``
>> +     - Anti-rollback image version
>> +   * - 0x05
>> +     - 1
>> +     - ``secure``
>> +     - Zero selects anti-rollback bank 0
>> +
>> +       Non-zero selects anti-rollback bank 1
>> +   * - 0x06
>> +     - 2
>> +     - ``reserved``
>> +     - Reserved
>> +   * - 0x08
>> +     - 8
>> +     - ``image_size``
>> +     - header0: prefix information
>> +
>> +       header1: aligned payload size
>> +   * - 0x10
>> +     - 8
>> +     - ``load_addr``
>> +     - Unused by the common authentication code
>> +   * - 0x18
>> +     - 4
>> +     - ``header_crc``
>> +     - K3: CRC32 over header bytes ``[0x00, 0x18)``
>> +   * - 0x1c
>> +     - 4
>> +     - ``image_crc``
>> +     - K3: CRC32 over the payload in header1 only
>> +
>> +``header1.image_size`` records the aligned payload size and therefore
>> +determines the location of signature1.
>> +
>> +Authentication
>> +--------------
>> +
>> +K1 and K3 apply different authentication policies:
>> +
>> +.. list-table::
>> +   :header-rows: 1
> 
> list-table format on this axis orientation is confusing to review
> without first rendering the formatted output, and is a problem for
> 'diff' tool output in future changes. Please flip the axis i.e.:
> 
> Category 1
>   SoC 1
>   SoC 2
>   SoC 3
> 
> Category 2
>   SoC 1
>   SoC 2
>   SoC 3
> 
> Write instead this as:
> 
> SoC 1
>   Category 1
>   Category 2
> 
> SoC 2
>   Category 1
>   Category 2
> 
> SoC 3
>   Category 1
>   Category 2
> 
>> +
>> +   * - Area
>> +     - K1
>> +     - K3 non-secure boot mode
>> +     - K3 secure boot mode
>> +   * - Root and OEM keys
>> +     - RSA-2048 moduli with an eFuse root-hash check when secure boot is
>> +       enabled
>> +     - Unused
>> +     - RSA-2048 moduli with an eFuse root-hash check
>> +   * - Header CRC
>> +     - Not checked separately
>> +     - header1 verified
>> +
>> +       header0 ignored
>> +     - Both verified and covered by RSA
>> +   * - Image CRC
>> +     - Not checked separately
>> +     - Payload CRC32 in header1
>> +     - Covered by RSA but not checked separately
>> +   * - signature0
>> +     - Verified with the root key over ``[0x100, 0xb00)``
>> +     - Unused
>> +     - Verified with the root key over ``[0x100, 0xb00)``
>> +   * - signature1
> 
> Why the mixed-use of square brackets and parenthesis?
> 
>> +     - Verified with the SPL key over header1 and the aligned payload
>> +     - Unused
>> +     - Verified with the SPL key over header1 and the aligned payload
>> +
>> +K1 verifies both signatures even without a programmed root-key hash. In this
>> +case, the root key comes from the image and is not authenticated by hardware,
>> +so the image, keys, and signatures can be replaced together.
>> +
>> +K3 uses CRC32 in non-secure boot mode and hardware-rooted RSA in secure boot
>> +mode.
>> +
>> +Creating an image
>> +-----------------
>> +
>> +U-Boot currently creates only K3 images for non-secure boot mode. Package an
>> +SPL payload with::
>> +
>> +    $ tools/mkimage -T smtimage -n k3 -d u-boot-spl.bin FSBL.bin
> 
> Use lowercase letters for the output filename if it is not any CONFIG_
> symbol or preprocessor define symbol, and re-use an existing filename
> stem as for example any of:
> 
> u-boot-spl.smtimage
> u-boot-spl-mkimage.bin
> u-boot-spl.bin.smtimage
> spl.bin
> 
> A distro package of u-boot or later user of the build system may copy
> this output to "FSBL.bin" but that is nothing to do with us here. In
> fact for documentation purpose here it is useful to retain "FSBL.bin" as
> a distinct description of the vendor firmware SPL and not get this
> confused for mainline u-boot.
> 
>> +
>> +K1 images and RSA-authenticated K3 images are not yet supported.
>>
> 
> This statement may be simply deleted. It is obvious that support does
> not exist when it is not described here. If you would like to keep this
> line it is not any problem. I think it is more unnecessary work for
> later to update and remove it.
> 
> -E

P.S. I somehow miss there is v3 of this series posted due to mail
configuration problem, ignore this response to v2 and I will re-send as
review of v3. Sorry for the noise. -E
