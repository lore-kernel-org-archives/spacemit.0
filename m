Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7A380FF1
	for <spacemit@lists.linux.dev>; Mon, 10 Aug 2026 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380340; cv=none; b=nCUAuDu6k3Z7Onn6FdpU9mv09i0Je+QnTabXt09L5B4nwdKpfjEQlLnb3uhg9kJpsDThZIe2/Oo7FAjkBRDsujSDAg/+FStbaqTdvegdqSOcrRuqzGTHTu7xDhou3nnGocxPIjsRDCgVxB7Ot7WfUboun4aLkux8rqAr/bKlVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380340; c=relaxed/simple;
	bh=wxoknguu1CzRJ2c0pM7TqqKBCKK8Zj686gej/8Nx6wc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mB3i90pfW56W9o0hfoxGIAXtBTrvR6obj47q2ae2KI/uGXPXT2SOQ2FPuWVCkdlqeLbJFwGdkqHReHeUU4TzfF4HDBoaYP/SXxMyzhIkpUBk7GQc3w2W9Nf61/gEOZBkpFMmaWEiAkN0KubcDmwP3xh8W9748sDQ61lcEx9/2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fVRPtGdo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ap+DSVmk; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fVRPtGdo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ap+DSVmk"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 60C4C14000EE;
	Mon, 10 Aug 2026 12:45:37 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 12:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786380335;
	 x=1786466735; bh=lpxjE5U8J1K3KxaaMGrkfg/EbIve1p16Oa+TwcKUQJw=; b=
	fVRPtGdow0C9/90EWbNdadH+EGbiMHOFZLkeHD8eg+p7vuVYvDe+P67slQZZPxYk
	ks/HpwB2kgKDlSahkJIBwQEvkXA/hNGn3YergZM9In/1PDFcqhur1NZgiWQQ8RM6
	1rynD85Lyb6i7tl6MppiT9DknY1A0XlAgaZWrJj1b3u7NoFVdozIb3AUXYkatWqt
	M5f4u3mvmnMJVO3qXiItZonxbEMyUSTN3G9w1yO189uAUeUqqaljvCiS07VSXY2d
	exd8Vs5wGgWB4O03obOy3T8s8xHyxSc1CPlYkvwaA3EfzWTDqFINw7b/a5zp8/fU
	v+EI91H/aE40P1beJIUSyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786380335; x=
	1786466735; bh=lpxjE5U8J1K3KxaaMGrkfg/EbIve1p16Oa+TwcKUQJw=; b=A
	p+DSVmkR9hn9qbnmhH6a/tKP+BRmsJz/KO9EHE7RhEUe4vc1WWb1dR+yE7zCpsW5
	4wi4kj7ZQFot7nsV+ZjaoOGPr/maOZybnAsMjOJPcLDTEjode69OTWGDUvkZPzdV
	IWnYV9exbbPzEnayMU64sq+qPseHddHG9EjRdNkXIRNJ2mS95OsR4SNwZnEP/tCi
	XD8tnWi6rKLYmeoXJaENmIshfWfkdB4aZAAsGpWZO3FZgsccbbNlloENDOCgj3f7
	cD1uXAAvu41yYKRcUQPZIebZcLkX/lWbFCfdVdUhUMBzMLl9K5I2gCPdScdKjqup
	RPtwos+NeCdbGWWqmXWCA==
X-ME-Sender: <xms:KgB6alLxXu6lMZ_S0ZcgTilhUxbIaHgSPoQLcXaENgyxfw_kP3MyRQ>
    <xme:KgB6ar8_YzrQaxLGxIdNZehkkF3E87ljzYf_-San8cxnDVa17Lss596neBjUigwRW
    AAp_u1wTHIYvTPrXGbTkE1bOo2eOpWnKSFVY1slLgE0XIfBMeHgKAE>
X-ME-Proxy-Cause: dmFkZTE6+zm0femYuKAaBiSTN3t/qVF2PQ4JVfHQ2fZoZuE0cyTUNsP2k6o5+nHfuCMH95
    mJxixU1Oiy8PJb69mxdjfMUBKXaIz6Uc0GEQ/R197Zy5LtCLtKsJ3zWJP6tqbur5ehJ9w5
    XChmra6Hf6+1/snHFuUGuOKMET6DoW6nSydO2qnV/4PN66GoBy1qetVCuZGUeMIUcxE1A4
    7RvwaVZf8JHBa26e35oQgVsYLL9VbPvI3Gy0+WrCD8xcy7J2RYjQbHFgXZJMmV0vDHMxdA
    VifjCmZeujfc4bc72AI03xaqjT8rh1dAE9EPQlxk9J9UnuKwYCnPPEZB6XTteyVLzObeGS
    0c1BA8p63m/a71VRo4HymxfhNqW/6v4J7lJZYLs0SEzt4pjNQqoBth+hNt6/mNfxuOsxAp
    Uvex3vA9KUkjDnLYN0wk3tbpMlg4LmuolHC61SDXOsWQyMW+tlQ9yvuEVotkmwymH9gxTu
    NFVqMFJbfLULIZHuVMfQ2eZENgpm5GLGucUdGdwJDEUP2u2S27FBB7ckEQ6JZ3BwoVFghk
    L8YufGDA20V8GvqA42O5B3OuS//SRluF5G+4TD76yIfvsucwQYNMNUEGs0xI20lFnVk30J
    aVpgh9W8RButhqYbCD/dZosSLczykYNjVLmX4HJG5p8ELr7UxReGoQwGNV8w
X-ME-Proxy: <xmx:LAB6ahLkkOgmyHutDAG2nqvtGK20Ns5asWK_CI84SHnsY3EbrRfHyw>
    <xmx:LAB6apJF6e_t5lEk6oyKulKiltTMKp5ZWGy3n-ZG7FSOaujKh42BOA>
    <xmx:LAB6ar4bL_wYc_yPStCPb3hTojtcalRnKjUgzC5t54Bduxoi3MscSQ>
    <xmx:LAB6ajdk1zyDXjn19c8vGCeAjRezAE6uCElwdh8hLI2YGoUhaLGlAw>
    <xmx:LwB6arLPuL1NMgCL3IiPXbKUgA06cDfXBNnf1aGP17VoGqj5vxnlzhIF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4D5DC32A0066; Mon, 10 Aug 2026 12:45:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: APVFqOvuG48w
Date: Mon, 10 Aug 2026 18:45:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yixun Lan" <dlan@kernel.org>, soc@kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Message-Id: <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
In-Reply-To: <20260802024052-KYC1424545@kernel.org>
References: <20260802024052-KYC1424545@kernel.org>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:

> Troy Mitchell (1):
>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

This commit caused a build failure, so I reverted it for the 7.3
merge window:

    Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'

Please make sure that each pull request you send is free of
build failures and warnings and works on its own.

     Arnd
