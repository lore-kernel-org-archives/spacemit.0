Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28D35C1B6
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449880; cv=none; b=ERYGwsMzfdngL31KlNvUmV4sG6Imy9wFbxoe2DYEeWSee0xgg8zxy0B+hVbtvsIg/7J71aT9A39hjTz5yW/GHIe2q9JTdg7s4yoVkqip0XshN+VECU2sVfZ2BkDDFaldeF8pS7RJcsrWL/VUn6csC+xi+mmeuWJFIbK1iSYvnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449880; c=relaxed/simple;
	bh=dX7QsEGz4VtKbIHdSeXLo6QP+Ue7Cyb5IAqSUgvZDPU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jnUuq81IW1FpMNt8+i+sychIStU/toC3oYbzCet0369f16YDzY5ytmDfp4x/8h+oLE3FtMWaOurM7LyXJ+dUmOtAMUMGJZX2unyw+N70zml0XLo3RkWD2KzdiPyp2wRgVX9pyFiKX+BStYwXy6omAy7D/9u74jSoAGUX0kAmVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=glExagUF; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="glExagUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449837;
	bh=5fUuBfC7bwv1lJmKApj9TAOEI13YVB4KodPqQkdcyHw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=glExagUFudUmYO9R/zBtHFDsBXcSE0OOiED2unKkrroaQgMLf7jMFA/uNTw/QPhgT
	 8xIECRqZmn3T2WcYEfdmw7FowWKQyT4WjmSTO41ryUdnib3FO5EhShXCtzOeFk8MdT
	 4RMcQ6Y8Orp4P77iOPqOUMzIdOhHu6zSUaGIHN70=
X-QQ-mid: zesmtpgz3t1777449827t5d1bd17e
X-QQ-Originating-IP: rX94L3y+/0mK+XkUrL28TUJzyamFByYqjc5ZNvM/9pc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 16:03:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15618526834681889661
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 16:03:46 +0800
Message-Id: <DI5HDLS7LRAX.3M0H0KH046K04@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX
 is running
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
 <afFuXO3IfV6CSsLf@sirena.co.uk>
In-Reply-To: <afFuXO3IfV6CSsLf@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OICmperGwjZpPesqIXqUQ0E3vUhzD+lcZ8nMk+H9tFd2yNxrF2CtjVTr
	yET02pxemhP+7yavT2zXw/hTFZ9GoJg0FnOFB3qxg2KWGQ/W5+lNLrbXgnTwHGCEBolW3Lx
	Mq4dWZ+BkuYxTFK5pPmmFVnmnM997F/Xd8jE4dtaUBH4Dqme9cqw8vtK4uDh2nIptJ0oQko
	E4mcpvNEHNoH3w7hz8qf9WRmtN6QkZSMdjSMAmK2iAhKhqUnJ/fwIUn8CGSZzD34WcO6lQy
	ACvnp8UQlg4GP3HVw9Zc18npA13doLDmij8WgOqO4H2A3btzqZyRNZw7EDOekZRnvcwbij+
	tTZMVPm7h8/SlZsG7bQY39ywh8QDwHlmH5Km3P2yWyzYP52sBf1Z6zMIxX7492F3KNobgIN
	qTccjYVJR3CjDvh6rmwvlxxzdlWO+RhRPlhgiEUnr//X0ug/91KD8xGDJETi934boTt34F+
	ZGWMCkTeAEcs3oY3W5jBg9WbSM0MI+62WNBn1yzlqQre16JVJWTL6/tUPttQ0jgwIz957uW
	xgxmjXr2+gidteIJ9nt6bp1SazoRViYzoFG7vcBrmTf4/o+ToNZGfhB9kS3r40tHE0JMAC6
	G24bCZqsc18W3LGgEUOXBbUu1yODq/4h0d6pJtv3uZPXyH9pvBEHCveSOPiCDIYX3TCHHXu
	9Tu9epA9Cjf8Z1KoCR+tA0eosMk7pEeWx7MLG1snU63jwowZoF50x1yoAC61kWJ9IFJR9sn
	uA8htJaz0xwSmy/5j9jmf8e34e5sKiojuAXPxxxQlRAhYy0zGJJTcu96P9twBQh66DiPmJ/
	UDo3P9mfva8KkZYfiJIU5NbmHKgRzFf0SORbMOaaz8jw9FOHkGIFfWHKRggSFOFEG9aRr5B
	fbPHEhQY/EL7hkJIuz6v3mnagRaEO+CQTtBysSA4t3lA7aisgub5b1EStOVsR+xNuw/Zrl3
	zhm9eUZiqrFNjbjatpf7n/UNkWI+SiL21auSIAJfCVM+aJD8oflqn9J5oCq8q7r7I1W9hAM
	YperCpqwP4AhQOl6TKCwdcZZsIBTMChyE/EIFrbFe/1WeJI5NtWzdlw4ypChvTGPFvyJRjB
	sp5pHrz+JUq
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:35 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
>
> 	Fixes tag: Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 =
SoC")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
should be fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

                          - Troy

