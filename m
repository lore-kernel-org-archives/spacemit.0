Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949251;
	b=rgRIaGmABqtJJzdecs9dNzK74c+22MYdXE4WjjTtHuzwqVaDN1fHLgbOgRNRI4lYxCpa
	 qaM71kvLQTGICEpxduaqlAb76ahBed7L6zKyd8naYOqBXT93paKzw81h1ySqgT3HvnpH6
	 BDjibdZHckLKkA8sZLqCL8YQVYuKyh0vo7c3g9E9S5HJCqvHarX4FjhRXmGL/F7VA1f4F
	 9UANXbgI//075cc+QJPduw5JtzlvbQOeSruNsXH3ZxLuNHjc9IHTEC8DoJMqMYSMyg9ZO
	 dHMva9ZJAzL4tjKfz4/823UeJK8HY8wVI5Dw7uyR55VyPwDM7aqBi3hXNonQnayRWxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949251;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5LgE57R3Il6gqjY4KmRL+QrcZ5QfaNmUauX8w1f2jTY=;
	b=VEje1LMZJjLnRZzdzZgN7wNE1Kh1gk6/6LP7LBhPBHJ05YDB2xA65l6rezdZubePZyZy
	 v59nAQF/3VUXm6qAYgdx9bPPYf3tKERMeaS79ADEGGRy1xjpu1jTjk9KsZ7sDJL/RWWcY
	 ubaZBJR+tXCQKzbCNgkjsrWjqjYlnK9HBLa+8aP5oaSavIbKRS9EdcaNVSCbTlamFB4UH
	 zS3jZ6Olo9CAZAqxSWj60TzzkywRN2Ktier/Qxdy2ipx8IapUFV4qzNgcIKL8cuRPXDp0
	 UChn3ZuQDIPnI3FfmmPl8xKYgcl0geZcNwWZggr0kQ71I1p33fXNaAIRRGmp6HEs8gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=OECdgrGt;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58835606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 21:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58835606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=OECdgrGt
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 1BD2020D7CF8;
	Tue, 17 Nov 2026 22:00:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E0F2820D556E;
	Tue, 17 Nov 2026 22:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E0F2820D556E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949248;
	bh=5LgE57R3Il6gqjY4KmRL+QrcZ5QfaNmUauX8w1f2jTY=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=OECdgrGt7F/A4nEpe+uekZG4Ss0w6m4RFRWG6nb01/iTAw/id9PF1tUpQwigo3gAn
	 LxFiv+/98H5EOAokzxAg0hfAJHs6pC/jHNwR27yQgA9ZHmTmJvYuiIKGMpPAjT+Zwc
	 OD6bjHo4T6F2mddItcvORWwmMVPINF3sjY/1SRWf299i/aWNbwJpGTduqpWa86WjUI
	 myDHDShTogLI2miKtPlZzCbjdoStnIJaVgApC94982uenNdWcVrG82CEmXLWVWctJi
	 DRb7Czr5u5L6hm3KHSPSltxEXvZ+p6GjxJyQn7bFcpocP+5uqdVCQ4FHpYLefIBXaT
	 +VC0vhyxRZU2A==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id khgeR7RBwUQf; Tue, 17 Nov 2026 22:00:47 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 9B94C20D7CF8;
	Tue, 17 Nov 2026 22:00:46 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
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
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3 fan
Date: Tue, 17 Nov 2026 21:59:45 +0100
Message-ID: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
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

The BPI-F3 fan header (J27) has a PWM line driven by an RCPU2 PWM
(GPIO 79). This series adds the RCPU2 PWM clocks and DT nodes and
enables the fan on the BPI-F3.

Patch 2 keeps pll1_aud_245p7 enabled: once clk_disable_unused() gates
it, accesses to the RCPU2 block hang the CPU (the vendor kernel keeps
it on through its RCPU firmware). It may be better tied to a power
domain once the K1 power domain driver lands; comments welcome.

Tested on a BPI-F3 on v7.4-rc1 (no fan with a PWM input at hand, so
with a multimeter on J27 pin 3): 0.86, 1.76, 2.74 and 4.66 V at 25,
50, 75 and 100% duty (0.04 V off), as with the vendor kernel, and
the fan goes to level 1 when the package reaches 40 C under load.

Trees: 1-3 clk, 4-5 SpacemiT DT (4 needs the IDs from 1), 6 riscv
defconfig. Depends on "reset: spacemit: Fix the RCPU2 PWM reset
registers" (reset/fixes).

Written with help from Claude (Anthropic); reviewed and tested on
hardware.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>


Fr=C3=A9d=C3=A9ric Mah=C3=A9 (6):
  dt-bindings: clock: spacemit: k1: Add RCPU2 PWM clocks
  clk: spacemit: k1: Keep pll1_aud_245p7 enabled
  clk: spacemit: k1: Add RCPU2 PWM clocks
  riscv: dts: spacemit: k1: Add RCPU2 PWM nodes
  riscv: dts: spacemit: k1-bananapi-f3: Add PWM fan
  riscv: defconfig: Enable PWM fan support

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 63 +++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 91 +++++++++++++++++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/clk/spacemit/ccu-k1.c                 | 45 ++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 12 +++
 6 files changed, 218 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 76613a144ac2f5db5511e6f3dc8645510933c14c
--=20
2.47.3

