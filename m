Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9A236453
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025766; cv=none; b=e5Bau14SUGtxOAJjvMwbCbGC+UEYqEVTRtVufLT6rbJ4CDtkhQFOygygTj1GfbQtYVTXdrVdE28VKoCi+Jy6u1H/ifuDoiqyYGA6WPVv3UiF5VidP+bxrahaRqRlpskZKVHp8Bno7K52Y73Erc8UQ2cAbrJpfVnCaf2N2wnW21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025766; c=relaxed/simple;
	bh=Ocq+KQD9/wpLJU3O08Fj31PBkcKG2sg2axl0If0Lp0k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=LhIzMXBRq39MD/VrXsJLInnWr7y78p0AV8N9w3ca7fN92Jf82cpW43oRlv/e1JltKSnufe7dwrjVyhyXVybcV9jntXmtg8NDGYhQo54tAywjwsScFpfZK9rNterdiv4vsKfCywhI/OaDa6esbCHxCkh1FXwqWadKoTWWY2ZA78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jrRD1U3H; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jrRD1U3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775025753;
	bh=5eLuO6Dg0v1DgrfHcmNBLPbXv7rnkJttNKIeZuJk6uI=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=jrRD1U3H0g61Hx8llloEoNmfP4qYExeCfrJpMdcToEShYAwM9C0iowE37F0KU7RG8
	 NXr3M035ly9SShMsyAnBD2D6pIgOnL+3Tu6mgH/oJbwtFfCiFUi13/LennsXPHg5H/
	 3T31uWOtnRrldmLmfnxr53BN6nm7Ar1S+I3ZceF8=
X-QQ-mid: esmtpsz16t1775025750t7591359d
X-QQ-Originating-IP: fUdCuzUb7Z94GHZIGs6Mh0OqBX5fgjt7XPKfo0NAQzU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Apr 2026 14:42:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10449797941589692616
EX-QQ-RecipientCnt: 19
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:42:28 +0800
Message-Id: <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Yixun Lan" <dlan@kernel.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
 <20260331085925-GKB976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OZF0DnLZf9EItsrKJz0Gd1l/CPcJOKCH38Rz39bMsnnSzvyhhRyUUmVr
	XdGwzh6vUfqC4SkGmg2DRhLYO5/gfC7y+p8GP8WGOI0cMkps8z0KhE9aUYqx6kSdXtXaIOp
	N6Ls+db6NogSPbDjd4DoRju/DyYqIfjanqdKllr43PLvNEiOMbSI+82rNZWfooTNdq1GLon
	bjzr7cRlKbCGoDPFsqv+OLu8pzKjvGdDS9hxyrc+FnW7GvcsUN8hL83TdSzgnb4oadKXfGH
	dpLQ26RrlWGH6bFKavlhPqCQmq1vovLPFL+Qb3uUIxheoy2R5q8Hg6t3Fi8CPQLWMeGNmBw
	/3Pdf/Id5/vTZI0mWKlA1TLxciLbL2QrRjzhWHTlE+v6VjxRIPy30ZQv4qz9kU68rHblROq
	QGBW7OwX+aJDZ08mEn2aLzig0iSXDvtwTeqrj+PQbuMeVDlndsjAFF+REc9p2k1F/+oVQxa
	f2FQjuQZJ7WBBPR86g8TWxwF0x3G2GNSrQvS31OeqfNj2uSaiONoFL+fa1aX/lzBZhcA4NL
	f+U7psDwcInbdns1yfgL5+6kIFSRELkH3Zodfn+SVwm2XHemUApQc3iJJHKxuniTVyqxUxc
	To01AEkfOBTvEqC0oJHQDmqjK/z62jWTUYsllrMLSi1N/FjNnrH7kv/s04Dem+8CX1U6HY5
	9tLFnEOZMFc/qBZL32ZwlCPAYk1hRXIcBf7pLKkZeZ5nLwjqOhb43Z583Sb3ArnxZbraIrn
	KmcJd7bqMD9KRMwsRwNQxKLSHVo2BKrFPgTYJsgFKevrySqzAS2aRkqmN7haa59Ij8ooWTu
	V2lTz4wc1dlG/iFB/FeNyJWcP0K5kDatNDts28EYHdHG0AZcSZmmPHcYt7r+qiZYilq/rd4
	ie61zlkVm7a/dajLIKgtdpnMnQOTXCK+GPH0sBhRnCtn98rm7TjutkplaRBo5WBwGcYss9v
	56cIVdl8ziSDV6NOnePbf/WVWJqi+gHUuB6l+rUs5isO0S/5O1H5BYgifmdxVip02kGsspc
	Qz+4PiWbBS24B4lQ2WnI+OVElJKehTL+azfPii3VCfVs2XB4Bwtjwp0Gbz4b0QkMut52u3s
	A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Wed Apr 1, 2026 at 2:10 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> Hi Lan,
>
>> From: "Yixun Lan"<dlan@kernel.org>
>> Hi Sandie,=C2=A0
>>=C2=A0
>> On 11:46 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
>> > From: sandiecao <sandie.cao@deepcomputing.io>
>> >=C2=A0
>> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-=
V
>> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
>> > which has (Framework) SKU FRANHQ0001.
>> >=C2=A0
>> > The FML13V05 board features:
>> > - SpacemiT K3 RISC-V SoC
>> > - LPDDR5 16GB or 32GB
>> > - eMMC 32GB ~128GB (Optional)
>> > - UFS 3.1 256G (Optional)
>> > - QSPI Flash
>> > - MicroSD Slot
>> > - PCIe-based Wi-Fi
>> > - 4 USB-C Ports
>> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
>> >=C2=A0
>> > This minimal device tree enables booting into a serial console with UA=
RT
>> > output.
>> >=C2=A0
>> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
>> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> > +&uart0 {
>> Can you also add pinctrl data explicitly?
>
> To avoid conflict,=C2=A0 the common pinctrl table "k3-pinctrl.dtsi" shoul=
d be uploaded by spacemit.=C2=A0
> Then we will add the pinctrl data after k3-pico-itx.dts. That should be a=
nother patch.=C2=A0
> Sandie
I think you don't understand what Yixun said.
You should add pinctrl properties here like:
pinctrl-0 =3D xxx;
pinctrl-names =3D "default";

While the bootloader is expected to initialize the UART pins, explicitly ad=
ding the pinctrl properties
ensures hardware state consistency.

                                      - Troy
