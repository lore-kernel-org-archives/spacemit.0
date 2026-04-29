Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0903A8736
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450046; cv=none; b=eRwf7yjXECt/Ehrny+0/sLypCialTZ9TeQYNsemAqrg0b8VXxyDZ+JjsF7KF73P/UKf1iLOeQaSBup/MYGwEDq8wf25W+OzTjfl6old4Vf484mTWa8aoFt7/ydl+5q5zTYAniC8kZhM+WYVKeXpkWTskGQS719gA/gv9kpQo/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450046; c=relaxed/simple;
	bh=VVYnj1NTnND102+Nf5YuvXZE1Q7Pxxugvsqk0sklmCc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EdxYXvHYVpkM5Inm8kYedVQvB8lyCQlMfmZxCPpKlYQHhhoyeEeuACqq9NR7zkYJ3GjrXrOyPcW3hDCyxSp4+EOzB6SPUwJ+nKZ4hlnhgT1Kl5Ty48cnmCNI4DkypyWkQ3BVzQoF2H0F9JLuMn3UpqSpCiIeXGx7D9fpyIKZDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pqZS+Yab; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pqZS+Yab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449999;
	bh=syEXayrqEHH29YbUaaMKUuDyp4pncudJ2CvPpGtXRfE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pqZS+Yab6+9tSiy+GOVi9eVyZrwDSC0NC70SLXjotszRyVe/OPW1bwSuI2Nj8KgQn
	 XQHxD6k7CvSU2RgOJEP5bAEJ66PXdbrDfEZuBKCDXD4nilJEROhMu+B/ERKzSv88J0
	 ewxA/UDEk086q5k1Qy7LHAkmeQQ11MyRVHeS5NCs=
X-QQ-mid: esmtpsz16t1777449991t0408f2f1
X-QQ-Originating-IP: zsMbRQkynHqJbH/L4Vq0BAqBfw14VUbJtUTjJQM+xnU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 16:06:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2472965661338442668
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 16:06:29 +0800
Message-Id: <DI5HFOQXG947.3NU2PDAFM2GYY@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property
 for SpacemiT K1/K3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
 <afFqgF6ZRwYdfUmL@sirena.co.uk>
In-Reply-To: <afFqgF6ZRwYdfUmL@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5aCtjAndv5OfIZmP/HxyXzlWjKdzdeX5c9fSXTUZeIHY2GoUf70tlRB
	9q2qRGl8WH0yvjeiS6FA61hCFCqDWfCt3C7t4qxCKMvpy7Ahk89btH2PximaNUuhrAhx7D6
	qNOqk/qifr6rrFQpO3V95zzVK6rrZpYthPhDGkfHgxJmnUX6n9/TQBCFjuvYbW0p+mEiM3t
	RCK+9nwS2ub8jdCcs0Q7+GpUC0fp34NVE2RTzR0r2wFpuDf8GUEM1IiqxQqunERrw8JTHAQ
	FOD8yWfGVLnK4uqgQ2E8Jxr1NvhDgi+f7hUVwWpjR2B2A2EmuvgVelIekjvncpji8/v3qLC
	nIMvRERaeU4VHJNwuC5vsMGCvejK61sAR5BV1etcqjYY0zCQjNpA5JP4IIknWKywDcd1g1H
	GXoe2GM/egNa1JvLTlj6HLws/FWrSvyBGU+IOkUdP8pW/cApdIXJ+Wy0QeYp866H4wEDF8l
	AVmtO46JouLmcpiWfFcs9NoK8afm9CeSkRFsS4edbWMhGpQUYZ+5Yu/T72VXGR5bhgkCflr
	PseJVf2P8UIa2cLWIRsX+WaKcj6c5EkwnhUtDdBqV/wk8Rq6FZvfP9T+JqwIu1QKN5AdosY
	LMznvyFNICtFHbvkRR5+uJhW067Xcly6feWyufX0xj80pRhczaVvgB805v7ySKw2RxH05+1
	uIQfWntKed10C8klbo1TNsXODcnhd6KWXQHwJgo06W2VliDoayiQzr8eSCyJBn4TTuuHcwx
	y/lMfqconoC9Wy1C4T9rkBx49Boy4DCabpDvSwmE+Z+W5PVyXzVhI9M6JqlVRHK0l3+y4pF
	3lVygiTPhvOFukboF58bLqFmQT/W9mG9RSJgztbOzyG8CzHB9I5tD39Pzh9MJaRwpVeVNmv
	ifKQTSRTc9VX94G094pd3Yp0R6m23OnFPFZmWkpoShDc9TWiBmFuO8jl3f4G7cvcQscMfw1
	p7BD/LNOzPGmsNX1rsDJ63eyPCmbsZCXrPzZVENlhc8j+TRd3GF4MwNWFVd6ezseHmQy4yy
	3Rhk30S0GztfJxHhi02tri8ZwzWEmL9UPz8wHZRU3ws2PApS8XfE6Gfl7y0rufZOCb2IvG4
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:18 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:50AM +0800, Troy Mitchell wrote:
>> Add the optional spacemit,fixed-sample-rate property. When multiple I2S
>> controllers share a common bclk, this property constrains all
>> controllers to the same sample rate. This applies to both K1 and K3
>> SoCs and is only needed when two or more I2S controllers are active
>> simultaneously.
>
> This doesn't seem controller specific, it should be factored out into
> the core - the same issue will apply with any system sharing a BCLK.

Agreed, this isn't SpacemiT-specific. I'll drop the fixed-sample-rate
patches (5/7 and 6/7) from the K3 series to keep things moving, and
follow up with a separate series that addresses the shared BCLK
constraint at the core level.

                              - Troy
