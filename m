Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712389;
	b=a+wwAqSX8rjpwk7k9wVCV2VcaEM67gkmiwbz9521giws3UQW9HyF2TkoQ+Uc3JT5z07w
	 Oj5DNAFnnlsiqgGhkHlctY4gfV7SI3pluVM1FQx1DfN68fi67NL30bb3aH9QfeUVAMamc
	 Nj+tf4G/GZFnEqm9qoL7DO6sMKuU+FzQzi0IXFVhs8IcIhomfLXNYHZ/I92drfqRR74hS
	 CzP9gft1S5LXl10d085S0q67e8iJ+f6vNsuNmVUPNhkLt67nkOzE50IeDDbTlxKeURMEj
	 jUrjxe/4U5o/W61W70j5x0lPALlLN5lZ5d8pkZNO4tqlHKPF/b9oXDXF5J/K5yFTZeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712389;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AHx1ZHDrqBb1Si3Vg9G24oWeMqKbUp9iTNo0v3fevqo=;
	b=o8xopavognY40gV2KLXy82BcB0K7MWJxDafw1XY8unR+ol0Dxc0owYlbO+/4D2Nm4BA5
	 I+qmPQX5QtXfjaFXCU1bXnMxv6TKypR2HapFhpLIS56DSK3s0uN5y5qKmiKi6SIMEgT6v
	 gSD6HmsyknI/jkekSdaCWBaA2Zhpn/jCqHmhy5PRESC4OMuyICcJPPkJuUER5zSGRzKUo
	 28Aww8lPYeL2pDTuoaha7AoyGMyQaniXVuuwTLMnXVe1z88kecaXQnz1wOeu71f8SErMv
	 1lWMrwHoE/94sjYQaNy3377obGgub0aryl71/8LJEqWc7OqR0KCVm0I202scdN1PtWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=JhouUIo+;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267D0606A31C
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 16:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=JhouUIo+
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 1A375210CB39;
	Thu, 26 Nov 2026 17:59:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E2B91210CB8B;
	Thu, 26 Nov 2026 17:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E2B91210CB8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712380;
	bh=AHx1ZHDrqBb1Si3Vg9G24oWeMqKbUp9iTNo0v3fevqo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=JhouUIo+srPjnJRPo3bBdddGVOSulP0WXkfsaXtn3NC7xUv/Pfq98honcLwGI1G+k
	 Uw699z0xEriJO1hFUqlceUnxaCxqxj/fg/1vRAq/PknZ2bhg+BrravmlOGRyqzRJiu
	 aaHK15FcJ8OWpFRjdlh869gCH+UBKH09Ac45nfKAhQtNEegq4Bq5s3D1oCfy/+khRC
	 PnPYUGfKYrIAemPme9H7I48OCRUtkdFu2gdq4ERf9dSDduRLVO9JlBid8IYnBoc0YC
	 /gdlf/6gW9IMolp8s2hWC09uOcAS84lajEQmzPRNLGNhtYzMqJhpWuU5MSeOoJBAWD
	 OlgjQyNZSYbdg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id mmMzcOV2bv_K; Thu, 26 Nov 2026 17:59:39 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 200E7210CB39;
	Thu, 26 Nov 2026 17:59:39 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/2] mmc: spacemit: Introduce tx delay DT property
Date: Thu, 26 Nov 2026 17:59:19 +0100
Message-ID: <20261126165920.905227-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
References: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
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

Hi Yixun,

Tested v2 on a Banana Pi BPI-F3 (v7.4-rc4) without the new property
(the board DT does not set it): no regression. The eMMC runs in HS400
enhanced strobe (256 MiB direct read at 210 MB/s), and an SD card in
high-speed mode reads at 15.6 MB/s. W=3D1 build is clean.
Testing done with the help of Claude (AI assistant).

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr> # BPI-F3

Fr=C3=A9d=C3=A9ric
