Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB19277029
	for <spacemit@lists.linux.dev>; Mon, 20 Apr 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677300; cv=none; b=OH/gjgnxbX6/KYQq3cCd4T8Z38TVQbr7TRtm17uD2ht+qAndWVO0VcmPlQdw202sGtlTUQplsfbq52YO5rbieOkckXT54crrUbICFa7xLcu0MH/qtz3TUZg1ODy5XiDG0XvlehCHUinKZNUxaxE00/cTQ1KfMECZYZpmwq5YTBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677300; c=relaxed/simple;
	bh=rdz7fRhMwRYmMwzR7OpopiOeP7M2xEl4x0F7Zr19seo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fgCUmtIxybhpkiIxXGqVRbvKVdiXzZ0bC9Jp7LpinZzcduSWky/3ddU+Ay2XfUxA+lZd/xZq8EX0wuh9/4eOKYp7jyiBAHLxaSE7YNPMYFlx6u7NHla5/j5//JnKSHn3cfDJH7tnv6HwnVD7+g1yuRfAucdGCJ3GfD8MCjUHgu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ug1TwNFO; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ug1TwNFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776677286;
	bh=Epg2XijeaAbCs5Ct+as2QF3IkV5HTxzlVZVwtKv66wk=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=ug1TwNFOoKJBJ44TrspwItJfW4I1GcQyvdDLKyPm9yjqIhOqEhBfbzMIq6iO7BdLD
	 piRDWeSZ+2I8GNVE3urw61M2vW47WqfABNWVGZtI8U9CY+ejw2D/mWYLdGqCEQwXwz
	 TEvopLBqSy0MeZ42SXKrHMJrDMafSbFXHgoggJCQ=
X-QQ-mid: zesmtpsz2t1776677279t4d3418c6
X-QQ-Originating-IP: OnBclwAmSm8kIWOHKvtJLXfl5OmN7/ZPSMWtVz2JVoU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 17:27:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4948310961083474313
EX-QQ-RecipientCnt: 16
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:27:55 +0800
Message-Id: <DHXVJ4GG8XSX.2HBP0VYODXHUG@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sandie Cao"
 <sandie.cao@deepcomputing.io>, "Conor Dooley" <conor+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
 <20260420090936-GKB203300@kernel.org>
In-Reply-To: <20260420090936-GKB203300@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mcbsrq6aJHkIMGGC+1Ze0PIQBw2lTBQHxJ9cuR2tdw6OmcFwMSr65spb
	470gbn+zfvhrftXN3isCPiX55Bn+YCIWC9pVr8WBL1tLJJIgKkg+iBqHO+qT3vu85qzvboT
	QzwRInTKPdmr+ppdYhDM5ECXrfcQesq3kWZtD/CHQf2slUkryixEq9wne+uyRgLN0cFkDeJ
	fSpr0zYpUysHJ7AiZvx0vb7Na6aty9rJ7iZBatJYxHODZspXEVyuESJAQoSRQ9UH35G+nB7
	nL0fYSdh3S0uKUvYSM6rLCiv4bt6SNr0kb25iS4LvXw5Br0u6Ay1XeY52EsyzTHVjMcdqMO
	hoTaA0+Va+pyjVfu3EQ77GnO5t+a+1x1egmPGL6cs1I5CCkTEXYZpboR3CQfOWnQRSlnJA/
	BHCcVkhtIYucklQVp91b/RnS4scg4WDOdw4Eoa1805fc4cWOv1uzgaR2LGrX58QRdDMEEDG
	5PYSzJXmBTI0wFAtuh5HAiphh7KR4gYd/lta9HP6rYG1mjHzqagZGbKO29pVxZw19OljoG8
	QozRJyGJY8nQEnhkPj2Bqgts+cXMfHsgsx0/bgmaYaa0yyomQu62zBqSIkhyhOFi6UUxIL4
	nIIJ7HLP724J0/cGPCUtY4Lu4vBNC93RU+NuP5tthLrb3cafsyMx+q+5VzfMQrzafE7YjxR
	ApHNZlPSunULyED9G2IfWoHmVEve1rxA4BmeoEK1NoZoCr1DaEzku77m38l2PudeMsfzdW0
	X1kZ6pwi9ULcuoIAPjhuLjlE9WLUN4oCoqH+7dCGekZeWes4T5UtTZU9fKYdcM1+kpG2Usu
	86T4PbindosLvqECVbGqfW5VFKGrtyYr/8vly1ywe/lL43s+jh5GO64eLCipa3kojn6AqGj
	GH7cK0WbGmWVRByZI7uIT9Otqvko87QhlQ9T0554QHRunsOfDArXXFscr+7HJXOUBMrsu3v
	UmytHOzkkTh4iy3atOvJ+iCvcuW9GAac2hUaNhSZ5YYKkJoC782M9rhy5C2FcD1C0A72iN5
	ZYW/J0sbQZff3xI6kGkuqITtysR31hrqPw0TRvP1t/ffcEwGAGtUdBY23EX25OI13ER2aUS
	hD6aJgaVIX5F9okTD4+fpbTUyJJ8qdJ2u8day6LUoTk
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Mon Apr 20, 2026 at 5:09 PM CST, Yixun Lan wrote:
> Hi Troy,
>
> On 16:50 Mon 20 Apr     , Troy Mitchell wrote:
>> On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
>> > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
>> >> On 20/04/2026 10:39, Sandie Cao wrote:
>> >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
>> >>=20
>> >> Missing space after main commit msg.
>> >>=20
>> >>> Reported-by: kernel test robot <lkp@intel.com>
>> >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.co=
m/
>> >>>
>> >
>> > Also, the file reported in above warning DOES NOT EXIST (I checked
>> > next-20260414).
>> In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
>>=20
>> properties:
>>   compatible:
>>     enum:
>>       - spacemit,k1-pinctrl
>>       - spacemit,k3-pinctrl
>>=20
> I think you refer to wrong file, which should be
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
My apologies, I overlooked that. The file you mentioned is indeed correct.
Thanks for pointing it out.

                                        - Troy
