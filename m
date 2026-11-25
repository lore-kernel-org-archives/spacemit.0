Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616529;
	b=TEe1UYtcIsbb8J2+5sg60V8FNOgWgbrtJSKSY/4g+BVQwbFyH/DSLukugWIE9f0PmcNg
	 J4ENFSsKiZ1dz0aTMD4jp2pgyLE0B4KR3nDljMkVa4SgueENjF5JFnHb+NVuz/DbhinyN
	 HFPr1Y2wsHFaQZyGHqwaoq1xbe2Q0g2fyunoHhDPbxmRGfyBBjmkodRMQr9vIzJIvt8d0
	 gUbNkXDM6gQUhdMB35invImvxWW2HVbHr/Nrrqn9/Qt108wDLHhYTTkp3HfK/NjR/O8oF
	 1qgqvBvhFho77/+oemkgBSRBI/PSWApEHMrdafoxky7kVIk6Q+XdPekW3X8t4mNFYzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
	b=i1VpJlfUkYVIEDuD7RVwn5dTF6fX9VVXPfBSFSzDc8jT7ARqPSO0i3m00L0mf4aBEE5T
	 +MXeTp7UZJnENH/J1p0H6nbnKn4Sks7AlUaJK1QDHjFl9jhnoke2A79dciUA8Zah5m4Mf
	 FEVGwHjY416EDsqlq8aDwEAe6SM0SZ1blL20+bDBt8M1LPYFzNamMs6CnJRb7YVBx6GdE
	 VUbmlJ0CHQJrPI5qqRbMovIqvYnmoMMeIpjM/4vFSr6cgfQcAXgL0Kg06bpOZIM36z5oE
	 7rhz5c8yZeD4rr/0us9y001weO5MmmdapkhH00/cWs1kBKEd8+fq6ovLSwkrQzrMT/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RKu/JO8+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3A606A31E
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 14:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKu/JO8+
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so6806923a12.1
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 06:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616527; cv=none;
        d=google.com; s=arc-20260327;
        b=IS7EeG6B+iF/piv05Tvr8uqB+tfYmW8MJs+nvoOhPmZog2US0MfMS0mKu8SluOrNGv
         nGtiRSksCpw9rZ+f0PaLOheqSSAynUqY3pxsPmzRLtY1Obp83IXisf+JkqM6KJeSuKOH
         Vac0AZJ3s6dBmXQB/mZThFMRcUtGOTDun0NH2cz/IhGg5zygv1H4RXRMHSHPdW2TNvfV
         xErMyHQJmvqbVv7NDMu0yORKOMRCKnVpy1MRj9tzkzgw3B/j/cvfQz0QGKD6OPO/MKm+
         6rpBA26b3DUDa2HqKtD8icMkBbgnL6if3IFJtRfCJfSq5GQkD60WCibAeXA5+CbgtBU+
         rQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        fh=PHBRL/07N2b+Y8VHMcPetcW39trBqdYKFNfQAkLl+8k=;
        b=h/ULoZTk6xloBMxMvIuZEmUfjB1NlTSnvT2FH3a5P349xfVnw4X76B85zJjVczmn3h
         32wn4b3lBlRTKY9pFWyJEKPvg1/riOBe9w+f0pYVdEgzlb/StKF9wcDre2aUlHG45TL3
         BtRH0GQF0WV9ivObpugUX/Nea+lhWWewgKDvTgFIXttSDPBoT8oIWnSQOagveIgH1fPv
         9cfcrc+tnck1UVD4umn90Yd8HJc7ukAJ5rxyTwHfHcLmlUAGnZnJL5cCyjWJf9WcNxxv
         gmMnHXi5glwSje+WAVChOm6PLVV8zjhTuPpa8LZQ/DMomUd+Z0BMVAf0Bc4pyZEudUZl
         +XuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616527; x=1796221327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=RKu/JO8+NHmz0PKH26C+kY7GZzbDnNEvZuiCgO6umXT6rZvEAHjPxXqmU9zZ7NoHZG
         oXyKXInRoZAOyvFMb2E3lrM4GyY3rMPXPGw0mIqPkkApqKmwzfOIJrEf1BLtOVwsnBMs
         x124qSNkuGgX8jT1iPdQ2L30HZ6POMX6POzCta57Sotzl6r1BXzPfr9SIYAMcItHN0Kh
         CpFyV/aVlOaST8qQjWeqSeVtFWkjO0/74y/gkMOYG6P8JIsJmcy5utL5OlswkSZErbTG
         /Pyvk3Uu6DkB3hQiDWNdbUIVZSGuC9SNAa/GaO6x/RjF12k1CXnERrukToGN3s+5arHy
         JkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616527; x=1796221327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=P3GrAAWmzzD4P1yT5qlnn9xEKxFu7MStRl+dISAH0kon+NJoaKHdfhGL5LeZN7pATt
         p1CG1MZU4PKptUjakIKTO3IHPyIdKNJLvd0OLNbsZsuf511ALu4N1B02PddhdGhKIyQz
         qLTOwj/aIxrlc0jaCn6pOAPaziPuJNurjIJZvs/XNnOem7UTdqxrRppQ4agshrMWujl0
         rM+U39mCrc727fLBHLV/Dqp0tzx01OtBoYEGA/RVVuvqFpRrM+lXrL0TtgfippxpdK98
         Q3crdScGXtyouHx2n2ZbS6hzuKh3d0KC/GmsCLmOQuj/EuBT53wu4iufTDI+avJ4qL32
         APyw==
X-Forwarded-Encrypted: i=1; AL+hErEPC/a0reS05YW2wU194kjMGnDxckudU+JT1ycODH18lCbrDzzygdfVlbaGBt1/RCsEavGD1eGeeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/IfcF5qfrZ+edEnQIMor3c5uJKsL1geq+VT+EFdkBi+RfcXRXF
	nXJMDS5X3n2jP66rhgmTs2ZjjFqfM+mqfiB+ZK1frbyeMMeUmLYZY6Ksd8WAuFUezGc610TQcwp
	itu3hEFv4YtcpgjWbGyW83tQk6310UBM=
X-Gm-Gg: AZFdTZf/MUsj3sTf8LU+ynjYUFlq64iH7jDw3vFwXei2R5cd0bll9CdSpcj6TrxK5dZ
	MBkcvpT3VaOhHspgqK6K45EJnr1yaaacki4kCxoPqHUkoIfPUQYkBCVKEq0fONTdMfUvc6awsoo
	EA50/6dOEMRNfEVNDitpCoE/ZZBbXjWwG0ZSCD6TsvQYgxjVz6auufDEoc3t8on5iP7oPIQ8Vvb
	XWgWuWzU6Adq/YwKxpbRu8bv+KKIrFv7DEe9H6oJ757YmX/0/30t87lux1jPyKrlO+qFvZvLTZF
	xcLpITstcL06xeK/jY9w3TtLq4shsTgFb+LUY7ZUH+16/20j2+yJ+Klea1YAnx59ZPnt2pjQNnK
	Y7uF3JHA5oWMboe4HxfbDlkJGBm8fbicvSafm
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:78a7 with SMTP id
 4fb4d7f45d1cf-6ba7b468320mr9290374a12.35.1795616526919; Wed, 25 Nov 2026
 06:22:06 -0800 (PST)
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
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
In-Reply-To: <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 19:51:54 +0530
X-Gm-Features: Aa3M54o9-c3RGYDe5yPxK4MpGdTfrRnEWaETWf2MdzNo7lC6NrDNImRWSOSHHdE
Message-ID: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Zixian Zeng <sycamoremoon376@gmail.com>
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

Hi Zixian,

On Wed, 25 Nov 2026 at 15:08, Zixian Zeng <sycamoremoon376@gmail.com> wrote=
:
>
> Hi Anand,
>
> On Wed, Nov 25, 2026 at 3:52=E2=80=AFPM Anand Moon <linux.amoon@gmail.com=
> wrote:
> >
> > Hi Aurelien,
> >
> > On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wro=
te:
> > >
> > > Hi Zixian,
> > >
> > > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > > Hi Aurelien,
> > > >
> > > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > > Hi,
> > > > >
> > > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [=
1]:
> > > > > > 256 bytes with an 8-byte write page, which can be found in sche=
matic[2].
> > > > > > The device tree declares pagesize =3D <16>, which does not matc=
h the
> > > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > > >
> > > > > Oops, I am not sure how I got that wrong. Sorry about that.
> > >
> > > The question of the page size has been raised in the initial review [=
1],
> > > and it seems that the GT24C02 has a 16-byte page size, while the
> > > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms t=
hat
> > > the B version is used. Sorry about the mistake.
> > >
> > > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4]=
 changed
> > > > > > together, based on the chip model shown in the schematic diagra=
m.
> > > > >
> > > > > The k1-milkv-jupiter board is also affected with the same issue, =
despite
> > > > > using a slightly different EEPROM (24C04).
> > > > >
> > > >
> > > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to =
have
> > > > the same issue, which you can find "Page Size: 16 bytes" in datashe=
et:
> > > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> > >
> > > Indeed you are correct, and I confirm that this is the exact version
> > > used on the schematics. Therefore there is no need to extend your pat=
ch,
> > > it can be merged that way.
> > >
> > > > But I don't have the board, simple test would be appreciated. Perha=
ps I
> > > > should include test steps in the commit message for the next revisi=
on.
> > >
> > > Unfortunately the board has the EEPROM write protection pin connected=
 to
> > > VCC, which means the write protection is enabled. Therefore testing i=
s
> > > not so easy.
> > >
> > > Regards
> > > Aurelien
> > >
> > > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> > > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au=
.pdf
> > >
> > Apologies, this is a different issue.
> >
> > I am currently working on enabling multi-DTB support in U-Boot SPL
> > for SpacemiT K1 boards.
> >
> > While investigating the board detection issue, I noticed that the EEPRO=
M
> > on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
> >
> > alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> > 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo...=
 $....|
> > 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.9=
8a9c3a|
> > 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;..=
......|
> > 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..........=
......|
> > *
> > 00000100
> >
> > Although the EEPROM is readable, the missing Product Name TLV entry
> > explains why read_product_name() returns `-ENOENT` (-2), assuming the
> > EEPROM read and validation succeed.
> >
> > Consequently, automatic board detection fails, and U-Boot falls back to
> > CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> > tree for the target board.
>
> Yes, exactly. I encountered the same problem. Board detect failed and the=
n used
> default device tree (MusePi Pro).
>
> > Since the SD card-detect GPIO polarity differs between the Banana Pi BP=
I-F3
> > and MusePi Pro, selecting the incorrect device tree can result in SD
> > card detection
> > and boot failures.
> >
> > The following SPL boot log shows the board detection failure, although
> > DDR initialization completes successfully:
> >
> > ```
> > U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +0=
530)
> > Fail to detect board:-2
> > vdd_core, value:900000
> > vdd_1v8, value:1800000
> > vdd_1v8_mmc, value:1800000
> > DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
> > DDR is ready
> > ```
> > Could you please confirm whether the Product Name TLV entry is
> > expected to be programmed into the EEPROM during manufacturing?
>
> Yes, No product name TLV entry in my Bananapi-f3 EEPROM. That's the reaso=
n
> I wanted to write EEPROM and found this EEPROM pagesize issue.
>
> > Also, is there a recommended approach for handling boards with missing
> > product information in the EEPROM to ensure reliable automatic device
> > tree selection?
>
> I'm not sure. Currently, after I corrected pagesize, I wrote EEPROM manua=
lly:
> ```
> U-Boot SPL 2027.01-rc2-00039-g4cff50f40343
> Get board name:k1-x_deb1
> vdd_core, value:900000
> vdd_1v8, value:1800000
> DDR firmware: [0xc081df80]:0xf0227179, size:0x8d98
> DDR is ready
> No SPI controller (-19)
> Trying to boot from MMC2
> ....
> =3D> tlv_eeprom
> TLV: 0
> TlvInfo Header:
>    Id String:    TlvInfo
>    Version:      1
>    Total Length: 29
> TLV Name             Code Len Value
> -------------------- ---- --- -----
> Base MAC Address     0x24   6 FE:FE:FE:90:1E:F0
> Product Name         0x21   9 k1-x_deb1
> MAC Addresses        0x2A   2 2
> CRC-32               0xFE   4 0xA88C93F0
> ```
> Maybe we can discuss this in u-boot mailling list? This is indeed a
> separate issue.
Correct, I will raise this issue over there.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Can you follow up with the patch to read the MAC address from the EEPROM.

$ git diff .
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1db896536256..3928a47b7702 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -137,6 +137,8 @@ &eth0 {
        pinctrl-0 =3D <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
        rx-internal-delay-ps =3D <0>;
        tx-internal-delay-ps =3D <0>;
+       nvmem-cells =3D <&mac_address 0>;
+       nvmem-cell-names =3D "mac-address";
        status =3D "okay";

        mdio-bus {
@@ -160,6 +162,8 @@ &eth1 {
        pinctrl-0 =3D <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
        rx-internal-delay-ps =3D <0>;
        tx-internal-delay-ps =3D <250>;
+       nvmem-cells =3D <&mac_address 1>;
+       nvmem-cell-names =3D "mac-address";
        status =3D "okay";

        mdio-bus {
@@ -202,7 +206,7 @@ eeprom@50 {
                nvmem-layout {
                        compatible =3D "onie,tlv-layout";

-                       mac-address {
+                       mac_address: mac-address {
                                #nvmem-cell-cells =3D <1>;
                        };


>
> Best regards,
> Zixian

Thanks
-Anand
