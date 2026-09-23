Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC242E42B
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154915; cv=none; b=luhf8HDKMMqtYQLwmNgaRd9gslYGr5PkV+mrQC0m6xkbEtTqravyHBDOSQf8+44VNlaRLP3thVfDGRrUIC4OFRlChYeBLgvr0A40nAZiWq1YP0VcD2iWLXE9GxevmicWhgMp9CNUd6mVWTLGXSHjfnrWWV0/BX4XoD7rtVYVjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154915; c=relaxed/simple;
	bh=RzHBofAf7YJyZ07FII2LvnkIIRSoJB9/EG93JfpCjsk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BYJ3jod8nfvNb+Y9WbobequNm6XS6ucYtAV6Q7+UfHZlxxQ8Tk3G7FE8nghNwNeuVE3DG3IGaIw6Wvdm/g4OyyXwdHlREvZ56/fgBSKY6fdEzeCX7Or6u+tVA17RkvTBBR5D6D11U/YmHitAWEbbumVskeTpHUoSeyOx83+t7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=qTh6+gCj; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="qTh6+gCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790154838;
	bh=RzHBofAf7YJyZ07FII2LvnkIIRSoJB9/EG93JfpCjsk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qTh6+gCj0Ox5+uY2pC252CptCozdENNnG6UbLAhSnyaSp1/Ur/vLefT8hd3luWNns
	 Jmi18Fc6/euvzgirXw/iUEEryfUJJ7ZPxD23DDTtuCPC4OwE7acfFimaerFfkelKZ6
	 kYtW0mUVxKujSKpUQOvEdG/caIWMALQzBzYZ6IKU=
X-QQ-mid: zesmtpsz3t1790154837t580f4562
X-QQ-Originating-IP: eFC3jACj3kP1sOn8Oha0w0ojCyaVTWCqfCWFgoeOviM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 17:13:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17194645670919471532
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 17:13:52 +0800
Message-Id: <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NnSC/w0LuVTXPThQKTEfRuA8vrufLoTnHxkeUq57ce6fJS4Yx3Ilmd3W
	jEaQv93SsNhPdDehy6+Rl8d1I23nST2T3GnS8ljPbP9ER5Xatv+ie3i56NxLfu26b1eptza
	HmpemmAgzg0ODHNTVOaCHgFOT42TDT3uPtUh78C8a/XV89HRfq8rKHze60LDU6MOJBIgv+9
	6caFIABG7hGszVoXKbl+yfHIBS1jxMaX8RB4ytP7JERq/Rl3ljAygYwX/irVf4MRM0tXCoE
	25QzVD9w1x4ziGSz/Xez4E+T09acz0B6Jm+DCjEpQ+Izs8QQcay30KC+T9AV5ErYKEVu3AW
	gHe0O5dtMxrGggw5pC0ZyZhbJ1iHOoP3HYCm8qPAKY8FlAzgbvEobt55RMWhVM//ZjA9TWy
	4TsfuYk06WT+JAoXsGHh7vpiuJbbF4s5tib1r6ay/SNfEPs5IDwcghiwqXirYD4k33e3yKg
	r5LJsIY+qOPxRo19OLoPpw7Z2UAfSKve+qH3HjlPSW2Oy5OHiLbOCT8idctwxQnH4sQpU69
	g6JRQ18WQvyLbePVGwwfglSU/5ACqNX2mp84hc47nJ93SyopuAo1lNFcufSt7c+3OCDk0R4
	o9/Z+kG5PA4zgUXNNxfjWWxIjH78KL4NK4672soYbK5+Qnc8z8lRL4haswYTPXGPZyjwtES
	66NAembmYMTpkFujC9JS8Kn6mQSQoFSqCkobnpjfZ4HPON5EndbXcNBbaUtZX3D4S3/+3KP
	KFoBuSXQVhdP0i+uMcru4W9SJpsWSKIl0SObSUadRXvouvbDedddglA43miendS8VFaRZNl
	p7nCu+DxSYLh5BdcEYekLzKvf36e7d6FFq+2jTcDmJmgOQ89i6kCW/H5GViIMfpcQ+svCJu
	4derOLm/ZmREgeRKFCQRDYpEVThjvosIcoz9GXMCwX/X7+y8wMQMixHR7oHXzm9x/Ndd/2m
	EKSa0hKlnfVHw461v1kHR0XkIbwFTVEkhe3FNhnNXLeQ9kNfEazqWnOj8/7Qoxf11oeLghy
	+KxW13FWLBGTfPuUF5ZlIKxhqGk63fVUnwPmezprWQstflpz5VN1WzCYPA3FHgG37ZADhrJ
	gfaobPEe/P2XfmH6zOVv1eyffCO0KNydYcqCoPFNULPWKSDIg8nOh6ksaK2ibOccDvTQTGB
	sCIr
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
> Hi, Troy:
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
>> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
>> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
>> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
>> > driver.
>>=C2=A0
>> An internal slot does not necessarily mean the card is non-removable.
>> I don't think its location alone justifies keeping card detect asserted:
>> GPIO88 would report a card present even when the slot is empty.
>
> Yes. The FML13V05 hardware is designed for this. We can't change it.=C2=
=A0

I may not have been clear: an internal card slot does not necessarily
mean the card is non-removable. If GPIO88 is connected to the
card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
the board, or does it reflect the state of that switch?

>
>>=C2=A0
>> > We check the vmmc-supply is p3v3. We have the same SDK DTS config with
>> > k3_com260[1] , so, this patch follows the SD card patch of k3_com260
>> > dts[2].
>> >
>> > If this is not correct, we will change it.
>>=C2=A0
>> Could you confirm from the schematics that the SD power wiring matches
>> CoM260 and that the card's VDD is actually connected to ALDO4? If so,
>> this supply reference is fine. The same SDK configuration alone does
>> not establish the wiring.
>>=C2=A0
>> If the card instead uses a fixed, always-on supply with no software powe=
r
>> control, vmmc-supply is optional for the MMC core; it should not point t=
o
>> an unrelated ALDO4 rail.
>
> We check the schematics both of COM260 and FML13V05, both use p3v3 (a fix=
ed, always-on supply with no software power control), not ALDO4. ALD04 is o=
nly for USB.
> We will correct it in next patch.
I'll send a separate patch to fix the CoM260 vmmc-supply reference.
You can focus on FML13V05 in this series.

>
> Best regards
> Sandie
>
>>=C2=A0
>> --=C2=A0
>> Troy Mitchell
>>=C2=A0


--=20
Troy Mitchell

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarOYUA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv/VcBANrKAZZo7hF1396yvrURKeblfk6N29sDuw3EfLqH
tZYVAQDII+/ULNRkpNFcStI32cx2tF70GmPyD9BkywqSZiBdDw==
=hVAn
-----END PGP SIGNATURE-----

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682--
