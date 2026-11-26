Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662040;
	b=xZa9Qm80EQZF0dVCmvWV8sbkavtkxKGuTXjw789IX4J4ApOx1zich1ZmcyLx0tgBcgrN
	 PW63dZFHQII1T6m5LZQpRUkUdel4iAnbyfEBQBAx5lxD8hL2Vp6JtROoSflSzhfxcKnSz
	 m8ntb2+cz2cVDoIWTOIP5cQKa+Q+rlDkaDHagOUFiqf9u4iBDrJwh4m7pIJ9A3dUvFvFA
	 y+IvTMhO0l8uIbbzr2D65aiVLqHwUtr09IBTeQQS6Vc6xiWpImPwe1qeXRDKD1R4F1ic7
	 i+7fgxhv/EDWxegxfuleXD9J2LcI5+72sHfAJQ8Zt80+fazq8busOynGOgUvgsmwYhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qo8eDsRv2uiFS+6Dv/msZizhScyU7dl4mbfwA+0p7MI=;
	b=5FMhi3G3MbiuNRaU63gvbb2lTa08EPzlkSmOxqGSaRcG3iUjxbcMKhBm/G9CaraZBOrn
	 2/35jNs93pwVheqGyfw4tpOSI2ZCmqjjwDnZtVkGfw4+PIZAVsH9o5fhrq7CdLivqer/l
	 mlixSQMkeFc1mFPfu7Ic7n85QTp1zyvNB49DwOUFdOt0oIoDd5oXjA/wV2De1xNc75ABt
	 NEcWwdg84RVu2io6nueuoy2nMfgP2WoasVcWMJjLOYc7qh8qhwSiiWYq5yJsG79GChKYg
	 g+fO+Nb5TKfNCc9lePUscmsrshHnCjd0huzGbHt7DfOR4yRTc62A5eAp1ZTFTAKT06g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NND8Koln;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB143606A321
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 03:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB143606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NND8Koln
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7207964c88.1
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 19:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662038; cv=none;
        d=google.com; s=arc-20260327;
        b=WHObSHmYmXKbQxkffryYoYMyj50W45yuLSCIKLvfPR8c7P7npUAW6hPG/rx4oT5l26
         G1FO2T17jeJLjBsRu/GZn7hkZ9J+hZLMUHKLbUiHa9Mk2MSfrc3jpqIt6+lT4fSp51yM
         HYkDisOBXdn/ondNhq0MSHQLnGCOb39VQDajSpY00QYNIEIzjjMmHTngPwkAgYSE6SdT
         zSTF7iehK9E5zrbInx1+dwuMXl250W6cCQ2Oso57qVKRlsm/EzWqe3GmcdxyZKTvgwHi
         +UZ008awn1LgiGbGt3Ek4yrC2KXFVEAYW4MGUmqTfxEHaHjY1Lw57HKGv+S/EjgrvASg
         G6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qo8eDsRv2uiFS+6Dv/msZizhScyU7dl4mbfwA+0p7MI=;
        fh=PLCfgK9mmCEuFz1suFLJInqRNTtp7R+GPk6/Dj4Cl8s=;
        b=Uyf2woRYOI2oaYGS6JUL1RdLesn3eb3APrVlVndXaGd7aOWiMnnMGnmzE0PBoOq/HR
         25AbdKZNMnzKYXBjvniKGTn1yyDh/z/gRt6oMfFVKWRn4y0Pjy6nS10LnTyIJY7UeXDm
         SEOqcKwktaMbKMsRYWcenP81JkTBy1q8maEXS8NQ8+UEy9WU//3ElLHwGJ3H3DK43Igv
         /IMnWZnnSynd/s2Qgl/S/gzwV4A2SRti/AJLotL4SC0muxkiGqk/xtjjOUqjC60rZHog
         /9MgQ+DctLEBmYzKcdCz3rS6z7UNQZ3dGnHI+ob8MZCcvza5u+WPKrCDkfyRVQugngoP
         +sWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662038; x=1796266838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qo8eDsRv2uiFS+6Dv/msZizhScyU7dl4mbfwA+0p7MI=;
        b=NND8KolnuU5U1VHvR3qabBSaLyKbPwbZM+1xIZiHZfEJlJPAB7X7iOSNX31GLq4fSL
         lhUgnL401rSscqi20wNo7ZgGzGecU0lt6wefSQNrBl3qWQxufBvuOt9gW5FSntbmnls/
         s4j5cWwhMtNr+Je8a1dofq4pNh4U/R8YRbD0SHY/vrlk/HR6f3RC9jPGBlFVR34EMkNk
         NE4v1IyJEVi8HMHk+1wBJc9fDxbn+dsl0u5UTOVYH5b6Z7i4Yugq2WmIdfQSgUgi2eir
         StUP0u49PTa7XM+2CmFrW5WMa0ou95VeifIHHPedUr8glqiYbOUwxrWQhp1EBEgjyVA7
         TkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662038; x=1796266838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo8eDsRv2uiFS+6Dv/msZizhScyU7dl4mbfwA+0p7MI=;
        b=eWtTqUCA2K+63GmtLdP+u2gFGN54gMh13g31fE21wkNtpTx+xPKl+q+hvGc5hb0FNt
         Mw6b+Q8gJXBJ8jj83vOAOXdA3NcvofZQ1Vlg5lWQZ6OuhLd61ObIhk4cFsQJjOEyXuES
         1G468y9gdxe/6lkGgmpDphiLawOMe+eEhnq0K8X7ex8sJzxLPZcdK7Mv4YUlibDgBqh0
         muXKUIs9EWWogtq4/vuTi07Qri3SwDtyLeqFvXDPSjk4Owls+mw0yjMXxRNFFAXdIywT
         3bIWfiLZ+aqThgOS69TlNXZbwhCzpvonFzQjUtYyRMcS8kP6gQzxlruLFcPswlM8noNy
         +UyQ==
X-Forwarded-Encrypted: i=1; AL+hErGn10uDJuVq7yKBXbqNbpcopCGRuEbpAhFdZdAh5k0TZIGqglbv54ZJcmqGnwhuVjojWlYmLi/+hg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DKK47NXbpGMb4XPq4pcyJvR7vF+XxriEbgB9qc1pymd2TSI+e
	JR6l/1FAzgtyoEA686nEeWSuqw6reGjrNEj3qUwsdF2saES6UUQv0jfrDM51kpfzwH6A7DkfhpV
	l6etCpGLYYkva8AB+5oe2URNRA8mI4jM=
X-Gm-Gg: AZFdTZfXdbL4uj1khn0c61Fuq4jPSc6lCoPI7GpKpzE5MM9MNchncTjCrpQXRo3KSvz
	u68MqowTcWRYQY4DJVCqdp5D9mY52cyQlYI6fe4X8W3KEwQ2ypOEPm0pEya5Cbjl1j+qQ/JeGwm
	JmnKOxlcEgYC3B0v2UTTbKW8BhKNckfObxYH/0Vmf66APMIuuGfAFrF5MjEWeurS/KAeMK1YSBl
	frZ8slBFJukEeUs0Har9BjbubVSxdY96EtbmIOHehss7OcofUVks7CQJAx5DerXtMujhLCpeOsg
	NLiKt5Jz5M/SLSC5WKGVdZeqS2dGQwsOpZ0ZoroJBYyEwmk+W6YHEMXcofsxBZ687UrEAjAtu1J
	/DBpNZoSnVR0t5M317BYEVVOxSR3doECsu8E=
X-Received: by 2002:a05:701b:2705:b0:1a0:f970:4f5d with SMTP id
 a92af1059eb24-1b55688b929mr18116460c88.17.1795662037782; Wed, 25 Nov 2026
 19:00:37 -0800 (PST)
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
 <awXUSuYOUQMPCl-5@aurel32.net> <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com> <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
In-Reply-To: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Thu, 26 Nov 2026 11:00:28 +0800
X-Gm-Features: Aa3M54rvKVtWSC9Zbb1uS3GLt-A84OUSrFyuO0wKhkcNlq12taKkBIh9NOUxvL4
Message-ID: <CAKyUbwVuigJqbXiVYS28QKodMELPEd1yNu1Q9xZvmA_TmRHOmg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anand,

On Wed, Nov 25, 2026 at 10:22=E2=80=AFPM Anand Moon <linux.amoon@gmail.com>=
 wrote:
>
> Hi Zixian,
>
> On Wed, 25 Nov 2026 at 15:08, Zixian Zeng <sycamoremoon376@gmail.com> wro=
te:
> >
> > Hi Anand,
> >
> > On Wed, Nov 25, 2026 at 3:52=E2=80=AFPM Anand Moon <linux.amoon@gmail.c=
om> wrote:
> > >
> > > Hi Aurelien,
> > >
> > > On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> w=
rote:
> > > >
> > > > Hi Zixian,
> > > >
> > > > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > > > Hi Aurelien,
> > > > >
> > > > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B=
 [1]:
> > > > > > > 256 bytes with an 8-byte write page, which can be found in sc=
hematic[2].
> > > > > > > The device tree declares pagesize =3D <16>, which does not ma=
tch the
> > > > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > > > >
> > > > > > Oops, I am not sure how I got that wrong. Sorry about that.
> > > >
> > > > The question of the page size has been raised in the initial review=
 [1],
> > > > and it seems that the GT24C02 has a 16-byte page size, while the
> > > > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms=
 that
> > > > the B version is used. Sorry about the mistake.
> > > >
> > > > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[=
4] changed
> > > > > > > together, based on the chip model shown in the schematic diag=
ram.
> > > > > >
> > > > > > The k1-milkv-jupiter board is also affected with the same issue=
, despite
> > > > > > using a slightly different EEPROM (24C04).
> > > > > >
> > > > >
> > > > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem t=
o have
> > > > > the same issue, which you can find "Page Size: 16 bytes" in datas=
heet:
> > > > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> > > >
> > > > Indeed you are correct, and I confirm that this is the exact versio=
n
> > > > used on the schematics. Therefore there is no need to extend your p=
atch,
> > > > it can be merged that way.
> > > >
> > > > > But I don't have the board, simple test would be appreciated. Per=
haps I
> > > > > should include test steps in the commit message for the next revi=
sion.
> > > >
> > > > Unfortunately the board has the EEPROM write protection pin connect=
ed to
> > > > VCC, which means the write protection is enabled. Therefore testing=
 is
> > > > not so easy.
> > > >
> > > > Regards
> > > > Aurelien
> > > >
> > > > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.ne=
t/
> > > > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_=
Au.pdf
> > > >
> > > Apologies, this is a different issue.
> > >
> > > I am currently working on enabling multi-DTB support in U-Boot SPL
> > > for SpacemiT K1 boards.
> > >
> > > While investigating the board detection issue, I noticed that the EEP=
ROM
> > > on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
> > >
> > > alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> > > 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo.=
.. $....|
> > > 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#=
.98a9c3a|
> > > 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;=
........|
> > > 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |........=
........|
> > > *
> > > 00000100
> > >
> > > Although the EEPROM is readable, the missing Product Name TLV entry
> > > explains why read_product_name() returns `-ENOENT` (-2), assuming the
> > > EEPROM read and validation succeed.
> > >
> > > Consequently, automatic board detection fails, and U-Boot falls back =
to
> > > CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> > > tree for the target board.
> >
> > Yes, exactly. I encountered the same problem. Board detect failed and t=
hen used
> > default device tree (MusePi Pro).
> >
> > > Since the SD card-detect GPIO polarity differs between the Banana Pi =
BPI-F3
> > > and MusePi Pro, selecting the incorrect device tree can result in SD
> > > card detection
> > > and boot failures.
> > >
> > > The following SPL boot log shows the board detection failure, althoug=
h
> > > DDR initialization completes successfully:
> > >
> > > ```
> > > U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 =
+0530)
> > > Fail to detect board:-2
> > > vdd_core, value:900000
> > > vdd_1v8, value:1800000
> > > vdd_1v8_mmc, value:1800000
> > > DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
> > > DDR is ready
> > > ```
> > > Could you please confirm whether the Product Name TLV entry is
> > > expected to be programmed into the EEPROM during manufacturing?
> >
> > Yes, No product name TLV entry in my Bananapi-f3 EEPROM. That's the rea=
son
> > I wanted to write EEPROM and found this EEPROM pagesize issue.
> >
> > > Also, is there a recommended approach for handling boards with missin=
g
> > > product information in the EEPROM to ensure reliable automatic device
> > > tree selection?
> >
> > I'm not sure. Currently, after I corrected pagesize, I wrote EEPROM man=
ually:
> > ```
> > U-Boot SPL 2027.01-rc2-00039-g4cff50f40343
> > Get board name:k1-x_deb1
> > vdd_core, value:900000
> > vdd_1v8, value:1800000
> > DDR firmware: [0xc081df80]:0xf0227179, size:0x8d98
> > DDR is ready
> > No SPI controller (-19)
> > Trying to boot from MMC2
> > ....
> > =3D> tlv_eeprom
> > TLV: 0
> > TlvInfo Header:
> >    Id String:    TlvInfo
> >    Version:      1
> >    Total Length: 29
> > TLV Name             Code Len Value
> > -------------------- ---- --- -----
> > Base MAC Address     0x24   6 FE:FE:FE:90:1E:F0
> > Product Name         0x21   9 k1-x_deb1
> > MAC Addresses        0x2A   2 2
> > CRC-32               0xFE   4 0xA88C93F0
> > ```
> > Maybe we can discuss this in u-boot mailling list? This is indeed a
> > separate issue.
> Correct, I will raise this issue over there.
>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
>
> Can you follow up with the patch to read the MAC address from the EEPROM.
>
> $ git diff .
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 1db896536256..3928a47b7702 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -137,6 +137,8 @@ &eth0 {
>         pinctrl-0 =3D <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
>         rx-internal-delay-ps =3D <0>;
>         tx-internal-delay-ps =3D <0>;
> +       nvmem-cells =3D <&mac_address 0>;
> +       nvmem-cell-names =3D "mac-address";
>         status =3D "okay";
>
>         mdio-bus {
> @@ -160,6 +162,8 @@ &eth1 {
>         pinctrl-0 =3D <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
>         rx-internal-delay-ps =3D <0>;
>         tx-internal-delay-ps =3D <250>;
> +       nvmem-cells =3D <&mac_address 1>;
> +       nvmem-cell-names =3D "mac-address";
>         status =3D "okay";
>
>         mdio-bus {
> @@ -202,7 +206,7 @@ eeprom@50 {
>                 nvmem-layout {
>                         compatible =3D "onie,tlv-layout";
>
> -                       mac-address {
> +                       mac_address: mac-address {
>                                 #nvmem-cell-cells =3D <1>;
>                         };
>
>
Here's the output after apply patch above:

```
# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 10=
00
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether fe:fe:fe:90:1e:f0 brd ff:ff:ff:ff:ff:ff
    inet 10.5.1.16/24 brd 10.5.1.255 scope global dynamic noprefixroute eth=
0
       valid_lft 7160sec preferred_lft 6260sec
    inet6 fe80::cd94:5cdf:4509:a820/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether fe:fe:fe:90:1e:f1 brd ff:ff:ff:ff:ff:ff
    inet 10.5.1.14/24 brd 10.5.1.255 scope global dynamic noprefixroute eth=
1
       valid_lft 7160sec preferred_lft 6260sec
    inet6 fe80::452b:e032:5630:39ac/64 scope link
       valid_lft forever preferred_lft forever
# hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
00000000  54 6c 76 49 6e 66 6f 00  01 00 1d 24 06 fe fe fe  |TlvInfo....$..=
..|
00000010  90 1e f0 21 09 6b 31 2d  78 5f 64 65 62 31 2a 02  |...!.k1-x_deb1=
*.|
00000020  00 02 fe 04 a8 8c 93 f0  ff ff ff ff ff ff ff ff  |..............=
..|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100
```

I think 'fe:fe:fe:90:1e:f0' is read from EEPROM. btw, I wrote product name
manually (k1-x_deb).

Best regards,
Zixian
