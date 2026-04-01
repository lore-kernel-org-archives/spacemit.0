Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DBD38B159
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030148; cv=none; b=aThJ9gwBvg7gtY0rAhyxOxlpuZYfOYWe1tJwTIERy9H9pd+7Dh+9OlTdTOFgnRH3+mrX/0p+XSDDTBQDoFt/cUyZocq217naCbQpfqHAtfgAICM3JURyvMCKdmxDKH9oz1wq0GKzSJdq3trppBoQ0kY9M244ELX0E2BEd4pKmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030148; c=relaxed/simple;
	bh=CT50A4xwutwJ+vI/0EwKf8DQidgJMRHoghgAruhctko=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=IWplWFW5k6P1B1nJiFUCJlUDFlp+3/bgALma9ge2aQ1yOSJv22EsuNoQsUpfyA/nD70j8eNVTBog8cNwa6XR5rhyMgJI11cFRuaVOVGcjcuzdLBavnFSHfIZWqF2DtCxWO74RfLLARdf3EJW0Qjyvs9VioFA2s5V1R+TjMCJfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=y4zzWAMw; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="y4zzWAMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775030141;
	bh=pWzJr5sN+/hj9UGTGfh32k1ECCerwnrLHHRDyRKuunw=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=y4zzWAMwMy88ihF1CmXxJnrUq+Nn/kjPle7WAmyTbFB77V2C4pDQSVtbsT+RD6Q1D
	 QVJpUHUr7tolUBO3MhuqozT+8c+9zlX/IKtyyib/GVuMhxfSa8m/bBe1VQ6cbMUoZ6
	 VrZ2ZW2wknaZ4J4U1vDX3KOMcYMeNP9xADOt9AGM=
X-QQ-mid: zesmtpgz7t1775030139t3da3fef7
X-QQ-Originating-IP: jHB4dQ90D0UyoRXCU+PAjdnY1rkum7sDxOJO5sDA4Q8=
Received: from = ( [183.48.246.31])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Apr 2026 15:55:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13337976862729012487
EX-QQ-RecipientCnt: 19
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:55:36 +0800
Message-Id: <DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Emil Renner Berthing" <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
 <20260331085925-GKB976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn> <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NUnqcaL5M9AOaNd/If2rOnCdZtRZKgRdWz9zQcjOTS6HulsSJuU36Nxl
	PP2iOq1sq5qwuCyJ18U2xlEjL1bqRzM/epHlZLbjbKLHeq6sfb02rIXrBswqM0tpDkovnuR
	rDmLuDwqjEwHnt2gj3t/4nIv38DSZJBn43LfeFfoEwwB+GfovnmMKxDghxUFAJSpzdOSt3e
	XiNZS4/Vn7bKckTOCPkLwUd+84TRdYetUb7VWL4AHDR837qBlTEMiXMWY8bDtJk8GLZqd7U
	xonNqpAKZB8YiLxmel5xLSNkbm3zhsU07C9stzrjt33kRE8K0CNbtBfVhrpF1fLklscFbbx
	NV2B2Tfy7EO4V/+cRxKcwaSpmy7EFpmzT7QcNFZrgXhAjoBmh8nsHXn4PwbhDU7qC8HVJsD
	8l7A3OMLhqModI9dfdkjJzpbEvvVohv2M7ybGMTcF3s6xQBqEMehuBoftbGLqLaDbQCzHEs
	IcGr7WqAud+3ny2zlG8aSZpqFUOQAlMuY7+ZTgExlcqeTP0GQIdxS2Zd7/xPBHeLcbjhmqk
	hATjc9wZpT2k/u+KOAk8sGEsd1TSHO05Ifz1gh1NVXxBnmWYyaK8d6/QwEHKhVTjjeGfk1C
	597zOMFBQPHbuaF7qUs+bUycgDqmWOPco0jwe/goxKXpazX4+pTY1hDINGotxayTtC9z4s+
	uS5p7RR01Fcft2OuhyFgHoAPXnhKN/vx7UbVMGBrnkjIsXENKjpdbWCe+L8FjU9VKCdeQK3
	TXHsYAF6VwkbBkv1WbRHP5nv0nqUKcdixIPYRT2abSInKJbk1iDzdGY4Y0ofaFDCrwFUm1g
	dUN1t2s6IO6ejd78XPlLfTxfNBYoToLMXu6xIQxJt11DVohsbWOYc0g9AXn26Qcgs4QRRVz
	Cc+LXqOD1KLaS1zRna18YOVMv+DW7HOtroy6bPXP47O+1qOimEmmAfyBYX4rWii8jZl3oEv
	U18ChHACiD+B57G5VBxZPgz30tX/+hGQDgEYSWSZuGYIwux1RkJZyofAI3rRAhXC63H4JKP
	aZgm3zcAi8Z8AHWQOc3x0vd1ufiNxQ1u51e3vmoe2h8xVkMGo4CsFRswQYWO43g0EqwLVYb
	wRLEL7PUWAxG6LONNq4m7UdI3mHvGIAKDZmd9dEasGhWeTXB1xalSVaFnW4fqKLe1048oAx
	IabkfAT31pSXS0k=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Wed Apr 1, 2026 at 3:38 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> Hi Troy,
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Apr 1, 2026, 14:42
>
>> On Wed Apr 1, 2026 at 2:10 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
>> > Hi Lan,
>> >
>> >> From: "Yixun Lan"<dlan@kernel.org>
>> >> Hi Sandie,=C2=A0
>> >>=C2=A0
>> >> On 11:46 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
>> >> > From: sandiecao <sandie.cao@deepcomputing.io>
>> >> >=C2=A0
>> >> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RI=
SC-V
>> >> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
>> >> > which has (Framework) SKU FRANHQ0001.
>> >> >=C2=A0
>> >> > The FML13V05 board features:
>> >> > - SpacemiT K3 RISC-V SoC
>> >> > - LPDDR5 16GB or 32GB
>> >> > - eMMC 32GB ~128GB (Optional)
>> >> > - UFS 3.1 256G (Optional)
>> >> > - QSPI Flash
>> >> > - MicroSD Slot
>> >> > - PCIe-based Wi-Fi
>> >> > - 4 USB-C Ports
>> >> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>> >> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>> >> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
>> >> >=C2=A0
>> >> > This minimal device tree enables booting into a serial console with=
 UART
>> >> > output.
>> >> >=C2=A0
>> >> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
>> >> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com=
>
>> >> > +&uart0 {
>> >> Can you also add pinctrl data explicitly?
>> >
>> > To avoid conflict,=C2=A0 the common pinctrl table "k3-pinctrl.dtsi" sh=
ould be uploaded by spacemit.=C2=A0
>> > Then we will add the pinctrl data after k3-pico-itx.dts. That should b=
e another patch.=C2=A0
>> > Sandie
>> I think you don't understand what Yixun said.
>> You should add pinctrl properties here like:
>> pinctrl-0 =3D xxx;
>> pinctrl-names =3D "default";
>>=C2=A0
>> While the bootloader is expected to initialize the UART pins, explicitly=
 adding the pinctrl properties
>> ensures hardware state consistency.
>>=C2=A0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
>>=C2=A0
>
> Yes, I know this.
> If I add=C2=A0
> =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-names =3D "default";
> =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-0 =3D <&uart0_0_cfg>;
> Then also need to add
> &pinctrl {
> =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 uart0_0_cfg: uart0-0-cfg {
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 uart0-0-pins=
 {
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 pinmux =3D <K3_PADCONF(149, 2)>, =C2=A0 =C2=A0 =C2=A0=C2=
=A0 /* uart0 tx */
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <K3_PADCONF(150, 2)>; =C2=A0 =
=C2=A0 =C2=A0=C2=A0 /* uart0 rx */
>
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 bias-pull-up; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 /* normal pull-up */
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 drive-strength =3D <25>; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0 /* DS8 */
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 };
> =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 };
> };
> But this part is common, it should be defined in common pinctrl table "k3=
-pinctrl.dtsi". And this part hasn't comed to Upstream.
This line exceeds 100 characters

> If I add it currently,=C2=A0 When k3-pinctrl.dtsi is accepted by Upstream=
, we need to remove it again.
> So we just empty it for simple.
No, It looks like your base commit is wrong.
It has been merged here [1] that what you said.

By the way, I noticed that the name in your 'From' header for this reply do=
esn't match the one in
your patch submission. It would be better to keep them consistent to avoid =
any confusion for the
maintainers/reviewers regarding the authorship of the response.

Link:
https://lore.kernel.org/all/177340832523.17050.323606076175943251.b4-ty@ker=
nel.org/ [1]


                                    - Troy

