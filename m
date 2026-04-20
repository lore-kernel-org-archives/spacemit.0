Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87A37FF50
	for <spacemit@lists.linux.dev>; Mon, 20 Apr 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677730; cv=none; b=mjZFOFKGDEBdr/F7pr21MEwUEkrJpQmleIE0fIpvzD1dpNCVa+h43c2xAsefB7PPa+9hgGjeMskTS/VXIW937Qc8WffjSjHbBa1UnkJ1rq7OcE8m/86FXbOws+TIGKryjN5IagWYrvDXUj4S1w3Vzb1n1v1S9AtBbTRqEg7okUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677730; c=relaxed/simple;
	bh=8W/J8aK+sWUGq5pncpL3L4qdZR0FZTI1XoD1DzM3QFg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Oiy7omOGYZ5JEuZSvmdZbhiN67M9B/ji+gEyYNhfKZTAF3CYboXfaHVJpFg0gBa5uTG7nz5DhAT3zrrDZP7PprqAfUu0V8o6/6+VsWUQrc9tx5dMpPyyulugqBq8JdjX94x9ngI5rm8UEZ5Bq+iFQUnNvokBP8k4fzWqM3B5USM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=y9dY48/l; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="y9dY48/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776677725;
	bh=vkXbNIbR++h6pZ5ZhTdpzW0zQcZfR0zYZFiVasZtcwg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=y9dY48/lFdNCv2em4ADMiyDDYROoAqiZuJE48fPMKtvmGMkdLvvhbDvEWCitPDsYA
	 ZzsLC4Jbcr1MVYxT/pix4i7h8rlKWI7DAh0gb/EaIloN1TNhElsWycvT8zoQhz1kVl
	 wBRflUXWFV2MlgvJERBDuGZsB19kU2Yl3km390ik=
X-QQ-mid: zesmtpgz7t1776677719t20d36658
X-QQ-Originating-IP: L8IWvy8kdMykC/iQ/0qMSe0QQFM6oUby0IAkvkRc1Dg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 17:35:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14122269761632793100
EX-QQ-RecipientCnt: 16
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:35:17 +0800
Message-Id: <DHXVORP1EJ4M.1ZOO1F7UVW11@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
 <20260420090936-GKB203300@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N/BaP5J2bFjv+cFlyBYAxWjq06zRbwPipQRfHHX9jufE+m+DfwljltAk
	DDKL9MEkGJlBl2uwtsuiXbgg7XYtFQfkSURsBNBIhtD8AiI0Yf2Lv3eiMi+FVFPRPo4kXkN
	kDy1IS0ysQeKwg55GdiFp40YR+2+s6XxP1ghb14iiDBx+ipRMtkgxTrwfDTSIK3zkS6G2Jr
	Te1LX7PLQYCIXQDJwYz5ROnmue/dkHxa0Tw5EWy1+LQhpsHXu4VQy248G2iizl6rX/hBNzB
	BJ1rWv6uiybQVF1i8/wTzbQv/7eCP1zWN+1WfdZdNmx1xAx0fRlQxE/OWwjxQpZaMqUBPrP
	ZTLYrEbVCX7+aJltzl047iWYJu19ukYgce0DdeXDmOebd5PbL8lGqkHQzdS073mrCIX2D1t
	DvMiw8mpZJclcRtqh0eVsprmAKwCpu7tbNfLraO3X/Vh4f3/MVHJadLpHMjJsH4zBatVJDj
	KqE0V0DhoiIEPA9ObrOVihsShmDkYj3D+7+ExdiaJqFOc0pSUgHiDi1weWlRxK1D5gvFvMc
	ZW5kEyVOg3BjtFih4WoiFa+HqKR0VxJOQRxlex1WLWyctV2J4R9bHADLbmdNAdroWSMa2qP
	ikP2g35mh0KKAm1SeNO8DgELvfSqO0JXwMmJNTH+hhjHZVtNqMTic0RFbqaYU9qKGLd9r9x
	wjlbL2vIgJST0Paj1TRmGCjKtUMJZmQmctpapivoQYF8gu3Ms6mI9yeuSavrk0WuDuYu9Ey
	JzP5vvCXNDjnVgJPxq8yQR9P/GIAzbx4XkQtkGKY3KrXRthC3qKzOJ1zhtPtBhnOVMlFm6Y
	NtPsfp+StA0nkAaPLM/C2jd1/lAoDINPCauMkNeAgSWuD6ViC4RI8d9Fk2W6GQvOrovQJFC
	kahiz56CCu9QFA5TZQjTADPO+8yUhAq27nXIuYcXoWa6OwoixxeOCDhAfoiyw/b1LF76ZaZ
	or3pB0rE5qPrHo/1+Jg3BwyH1y7sWHHaw/r/zXoBrn5UHomt/qIoFLgbTb9HoEFU4mkDGf9
	QwOQJfmjfcEufhTsJJlE9x0rHeOXOaC4pv7FjeUcKEEj3cAII85ffLK1LVPbeQ0lUJs9Ncd
	gfnsfWzIYPm7XHsG2dPB1mi3Lwe4PhugtPCX+osFNBH
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Mon Apr 20, 2026 at 5:26 PM CST, Sandie Cao wrote:
> Hi, Lan & Troy & Krzysztof :
>
>> From: "Yixun Lan"<dlan@kernel.org>
>> Date:=C2=A0 Mon, Apr 20, 2026, 17:09
>
>> Hi Troy,
>>=C2=A0
>> On 16:50 Mon 20 Apr =C2=A0 =C2=A0 , Troy Mitchell wrote:
>> > On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
>> > > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
>> > >> On 20/04/2026 10:39, Sandie Cao wrote:
>> > >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
>> > >>=C2=A0
>> > >> Missing space after main commit msg.
>> > >>=C2=A0
>> > >>> Reported-by: kernel test robot <lkp@intel.com>
>> > >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.=
com/
>> > >>>
>> > >
>> > > Also, the file reported in above warning DOES NOT EXIST (I checked
>> > > next-20260414).
>> > In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
>> >=C2=A0
>> > properties:
>> > =C2=A0 compatible:
>> > =C2=A0 =C2=A0 enum:
>> > =C2=A0 =C2=A0 =C2=A0 - spacemit,k1-pinctrl
>> > =C2=A0 =C2=A0 =C2=A0 - spacemit,k3-pinctrl
>> >=C2=A0
>> I think you refer to wrong file, which should be
>> =C2=A0Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>=C2=A0
>> > So there's no reason to use k1-i2c. As far as I can tell, while they a=
re the same IP,
>> > there are subtle differences between them.
>> >=C2=A0
>> But yes, the idea is correct, so NAK to this patch
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
>>=C2=A0
>> --=C2=A0
>> Yixun Lan (dlan)
>>=C2=A0
>
> Please know that, I send patch[1] to add DeepComputing FML13V05 board dev=
ice tree.=C2=A0 The patch is based on k1/dt-for-next[2].=C2=A0
> And it meets dtscheck issue:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
>
> On k1/dt-for-next, it doesn't have spacemit,k3-i2c in Documentation/devic=
etree/bindings/i2c/spacemit,k1-i2c.yaml.
> Or I use the wrong branch?=C2=A0
Yes... You are using a wrong branch I think.=20
The k1/dt-for-next branch in this repo is Dlan=E2=80=99s tree. Since DT bin=
dings are not within
his purview, they aren't included there. I only mentioned this repository e=
arlier to
show that the UART portion of the pinctrl dtsi has already been merged into=
 it;
it wasn't intended to be used as your development base.
>
> And what should I do for my patch[1] ? =C2=A0
I think you can use next-20260417 as your base commit.
Everything you need is available here.

                                      - Troy
>
> [1] https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepc=
omputing.io/
> [2] https://github.com/spacemit-com/linux/tree/k1/for-next#
>
> Best regards
> Sandie

