Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950202;
	b=NwYEH6zkk9/6J/hmpncpyvVMhAO5/x0XyfgjbqFStDzSQfh9/zSfKpXmxqvn4Fd4x2Lr
	 dOIkuWGeJSk5OP7Z5h3E5dccWTmynzrXM/2TeKhtLZsVhfYnU6XhzoimA0GiZ0ouY7rzb
	 +iRbyvkPAuE/aIf2IeD09kShNbAS9mfpv32EYQNH1gmRrmx01Zft5doEE0/DkW5yezZIH
	 qCfc5iObP4N04usADpgXGUpaEqX+AAH/4RCml9RyEZXxyj4s6y4mV338+jcVwZGCtQZeO
	 dZq8y8Fz4ZcRldj00gp1XYd4NZnOGYtk8aea0vbm1sac2c0ncx3LHq6WoEkUo0l5JSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950202;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nRqTMJzShimxvHzfTCPPnMzUFgDsbxOw3020xqbA690=;
	b=TmMV3fW7pvLune4DeF9SB/6vJBv6eDGXshDJci1K36tUjtLP7k4M+TFIvIgqDpGlB72e
	 n0vkP184J3hB743HfKfeeTQ63wYl433ix5rBBdhPWxfN9EXBC727HwAVXEsKeX5C1iKKA
	 7s1AmfHOQAxqD5OWnRcQkSoNewV56lWmaUNdaO65UJPkVz0WS4l+aEXfDWWe1+Hr9pm67
	 JN9Pmnbk7RWtXv48HMaYLF5ORhRNhEpTQV8IpK9BeUZxuoOKvaBlXh/7/E31huQBeSNl2
	 iZJY3A/UEIqcAlmlrEbAyH+ziG7jNtDVvI1V3p4BKK4OkRQKOw0Mh0PD7AGo0gKL9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Gud2wEmi;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E48606A32A
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 21:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Gud2wEmi
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A586E20DC134;
	Tue, 17 Nov 2026 22:16:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 7BC4B20D5578;
	Tue, 17 Nov 2026 22:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 7BC4B20D5578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794950199;
	bh=nRqTMJzShimxvHzfTCPPnMzUFgDsbxOw3020xqbA690=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Gud2wEmiaIQS+G9oDe+ppbi8YJDwz3F5MYC0RXhiJXIjVG2uZgEeHopbDxXr/dlfS
	 xHP9aurbGcSRBxJLXOJNqTJMYidrOqwxdLKUbzWi14nS90jSWEJ5xtxg8a/x5bztRL
	 W6PooeL3SZuYaRhzb0ROSZUucanEKf5W7rgicRYBgQ53WSc+6KODHdg6COXrPpYOy3
	 +jeaLMGWl6CfUt7R5ntrIULj4rOPdlSGAl4rVr51xcmuvaBN4YU/1AnG57ttuBqA3s
	 ierLl20iJ/xbOJRGXK9nhseC2PthgpWeHVGkOvpiLNBVgHlHST9wazquJXMXBsjS2p
	 H0JiGtDE7ne0Q==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id a40u_yxKLD6u; Tue, 17 Nov 2026 22:16:39 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id BE8FB20DC134;
	Tue, 17 Nov 2026 22:16:37 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3 fan
Date: Tue, 17 Nov 2026 22:16:23 +0100
Message-ID: <20261117211626.141105-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Adding Troy, whose address I mistyped in the series (sorry). When
replying, please drop troy.mitchell@linux.spacemit.co.

Fr=C3=A9d=C3=A9ric
