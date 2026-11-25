Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593180;
	b=Hve9lh7A3c/2+NAnHOrgMSIxDW2aias6wyJHv/SoxtJlHTWhMyiuhXsF2orXtkWkMCaI
	 pwJw5iN4oXuRnUiM7wzymKY1UEpoH/RzwtLBmfbGsFW0JbErSA0/vA63F1qOZTIEdCblz
	 xOyyA73iguYJmpef7o9WyOdo8zsOOOr2SNKAdEb+2XtRB4ftywOq6AGrx2e1zikMb3fmw
	 X+qGeVcQOc9SRDD8eokIGfILRh4+j8rwEhkYmaxpdoZQtLy0hhF3qfdK5rIEHk6GPYQSV
	 2R/hV9PV+BXhU7QqeVvcVsCALh+sVRk4bDtHvSkC1JYYf7FL3d93v+7c5QwWkoHEJoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
	b=2VhP9e5R8r3FKH9OcTmef863JCSwQIJyBEcQcAggjNHkbvr2jX4YwzkPhKE9Uw9CWtFr
	 yt+1x0T9+HieJ3/LceXAEbISb8oPtsAPPQ0gLNS+fKWqGKPueYnW55g1pAd694qbol8S1
	 mhZO/pmHqNkV7uzWZ3htV83G5BiBv6y/y2BPmeiHFDvYQziKmNQ7XlICZLjyBSaLStt9V
	 R7PjC0nDBHwK5ar9qHHilGsyGLjw3oWRcaeafuCwmkYcz1+616spWoHaT8lc1INrJSsOH
	 dCUlQgPwcdpAZ1cK6HATIQ745EGj4N04fg7A6sNDSRPFRU+e/Ed3uzA17gsSO8z2img==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKeBnfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F0A606A323
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKeBnfR
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso6705117a12.0
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 23:52:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593178; cv=none;
        d=google.com; s=arc-20260327;
        b=OGVVHg1GBa+7hxMeSAbG/S9MbEWjQxSvLzLaGaSTEHDpcEQrPbYFC7Ck2WTsedlscE
         NoG7DgdKyNGJAr1lTle+sqeciA0kNY8R7ZMmxSjiOWWqFByg4RBuxnX1qaWDYDmF4u0b
         oTTlTIWIb7TSlOdY0sPbwk16/LhiGpifiLXWgBDu9gLqoylD5RtCgGzYxCoMFzJcGFK8
         ZgYa0UWhg0ObrBL37gY7wSy65NcWEduZxTkeqMtn1nd+qhrGwibummrpNSPgAD7wn/B5
         S9/KjyADs6jwc/pYqMSpSu4ZBnwxrksOhfNWJaa/2dO220r561JWTACM0qefDJCvPASv
         /x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        fh=ZRk8XPS3jZcblbxdRHbZtPHZ+ATIO8UJj1DZsHL93zM=;
        b=pTihj8a3gwbKPAYhiLYaIrW4NPOA3gWR6eeegt2J7XgAcNuMuWokSHnAq57mJxojXu
         k4KpwxpM/KEIhbohgrijWLiYyeXNavol74AKASc5Saz3rPHUF+U2vSyS10NgNBGyzPN9
         VVc/D34QUIojnInl/rWSrYKHaTSSXmmNvd6NOlwQn6RGuhCbSrD1ZYaut+NAW1MK2XYX
         kXHVs0jEReGJTXm8NFEjfsF22MgGs60sQSrmZcFJoagpgze57uYeosmyg3F3dgFBaXjM
         tIpnz3Xjkodef8DlTmpNlDyfVvfMBElhhS0rb+v+GgBLIWspBoCxbAYVNX4yIpcvfdbp
         iWIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593178; x=1796197978; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=mXKeBnfRjM6HLWfhZCKaY15obNVoKz2TxaXWOORuBGAo3/+SD+exVs6/Ff+2adoikv
         7nHR5cHn+vV/OriN6xV6sMOhaYr7mANe/JwDtiAgdbatnDLLzH/esqSm9hxVTZJitiwG
         banqdtIHP3/Dhne0wQQqaOSdP2cS4xlnX0xnXSWdR2mmasJP271QXh6VyIQtsLiCu8ek
         J7+lC7OBSN/dvcV7Lx1SRjp4m12GkUP6NgLimk5bB8FTJZwW6wl5U8oM/0cuu6qH794E
         aJ8wR8/4DnHS4Lmo7MCgDONTB9DSy2VGqGUuGKu+WsqrpC4YQNq8skVUG3MtYbST9x0G
         jUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593178; x=1796197978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=mdVKt1giD5h7kW0LfPnppO0nR1lfb9yGD2BKzBpFLeWqUNGXl01wg9I/CQ6cRkfX0/
         FlkLoFvsKrbcya9Ty87srwJNA7/hgEvl2L3Mn/yKQPH/acKaA/+t8CUd/604HRSV/Jqz
         g9H7FoXnISowycAnbIdLfeOyLJFktnMXAC7HJOBpZkTr3DHRO4ySSW898NrbsQ8BGMOx
         fPfQrPmsK9L82fUW9tcG53voyCCOKhcSH4r4anAurlfqfgIssa2yU0jAUh+qNwmUtK0U
         7V4q9yAQ172uxG3hf/i8mlLZMAfBJuBUfqKp1Or2ZoAnIGAeJLSyvYyuT+iRZy47PIT2
         oeHg==
X-Forwarded-Encrypted: i=1; AL+hErFLJlZ/8uxV7sGm2OQD9jJAwBZkABzZOcrtemdXv66QuJ6ZAJsxmtExqKFgmSfHSIrTkel9wYLFjg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/yfLns00zYE1NktYPKm8b5H9oNDXkFKlEHltYgdh82eooteLzE
	2D8YXXwPz25baAdgDGflOY102ipYPCOFCNKKGstFHoxphb3bvsb2ZtfZeRQdZikG2xVm828U1kr
	CaenxN8tLLliy5c8nCAfxAeiYO6C+/LNj38OR
X-Gm-Gg: AZFdTZeYrnfqGbCeQPA49xf1tpwNjfBCcbA9MdIGZ40yuHOgbEfWopKBoYcXOWZDo/F
	FwhSzzSR+O7LuqLhORb+24TO80m4mCoAE25vIG588w+u6OdBQF+iLdXIzwbYNIQAgxSerNm+hxz
	bluFOUKTZ2DSjmHqKH3fZd5rpGAhzEmg3rPJ4Qs2kjKD2aQ2tfpTgbAc7Yfa4DR0BQsUU53A++i
	zlwOIYoqjnUXGySsBxydlrfE1VpDQ4aMAmfS8jJ+untG7yCOINtl6mlJgL8z2IYlB29Oua/eRDC
	GLlJUt74OuHdHLKFtujvz+5vMQQVvgyueLPjbtdO/HAB+ULVNQpRfrzNKPAKnyYJc7KTeGVRz+2
	xrbgZe0PPiiKCUXL7Xv/BYBGI3ZT3CaFxvMM=
X-Received: by 2002:aa7:c0c5:0:b0:6b6:4dcd:9677 with SMTP id
 4fb4d7f45d1cf-6ba37d62867mr9467600a12.14.1795593178308; Tue, 24 Nov 2026
 23:52:58 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
In-Reply-To: <awXUSuYOUQMPCl-5@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 13:22:44 +0530
X-Gm-Features: Aa3M54q54Z3pQu7569lgjovS1EclOCcqRbeez4LQayhOiQc7wEhf9EIuKCN7Gzs
Message-ID: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Aurelien,

On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Zixian,
>
> On 2026-11-24 11:31, Zixian Zeng wrote:
> > Hi Aurelien,
> >
> > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > Hi,
> > >
> > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > > The device tree declares pagesize = <16>, which does not match the
> > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > >
> > > Oops, I am not sure how I got that wrong. Sorry about that.
>
> The question of the page size has been raised in the initial review [1],
> and it seems that the GT24C02 has a 16-byte page size, while the
> GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that
> the B version is used. Sorry about the mistake.
>
> > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > > together, based on the chip model shown in the schematic diagram.
> > >
> > > The k1-milkv-jupiter board is also affected with the same issue, despite
> > > using a slightly different EEPROM (24C04).
> > >
> >
> > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> > the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
>
> Indeed you are correct, and I confirm that this is the exact version
> used on the schematics. Therefore there is no need to extend your patch,
> it can be merged that way.
>
> > But I don't have the board, simple test would be appreciated. Perhaps I
> > should include test steps in the commit message for the next revision.
>
> Unfortunately the board has the EEPROM write protection pin connected to
> VCC, which means the write protection is enabled. Therefore testing is
> not so easy.
>
> Regards
> Aurelien
>
> [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf
>
Apologies, this is a different issue.

I am currently working on enabling multi-DTB support in U-Boot SPL
for SpacemiT K1 boards.

While investigating the board detection issue, I noticed that the EEPROM
on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.

alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00000100

Although the EEPROM is readable, the missing Product Name TLV entry
explains why read_product_name() returns `-ENOENT` (-2), assuming the
EEPROM read and validation succeed.

Consequently, automatic board detection fails, and U-Boot falls back to
CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
tree for the target board.

Since the SD card-detect GPIO polarity differs between the Banana Pi BPI-F3
and MusePi Pro, selecting the incorrect device tree can result in SD
card detection
and boot failures.

The following SPL boot log shows the board detection failure, although
DDR initialization completes successfully:

```
U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +0530)
Fail to detect board:-2
vdd_core, value:900000
vdd_1v8, value:1800000
vdd_1v8_mmc, value:1800000
DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
DDR is ready
```
Could you please confirm whether the Product Name TLV entry is
expected to be programmed into the EEPROM during manufacturing?

Also, is there a recommended approach for handling boards with missing
product information in the EEPROM to ensure reliable automatic device
tree selection?

> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
>
Thanks
-Anand
