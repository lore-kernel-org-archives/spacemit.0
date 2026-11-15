Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772377;
	b=JluIM93F4a9xTXKS7IKC7+aFudXslBO9MjcnXQ5QF9xxe6Uu9qyoK1VwUfvS2xqIC4hn
	 9FoFlpbNk+YfcH23WBwmsrXniKxfm3OtTRvKsERaPGUyfNw66GveA055eh0iad0612U9M
	 kqwjBwWMurWNECjdIDVinSFZaQfoSFfcW3D+moEFFd3LMvEQogp8ERUCvNmDouXeFyNzm
	 1ed/mwC97usdjbua2M6IwbZehKEd657JLkrz7FfTvKUSbhcP5O0KnycNUHKWobodE/l0v
	 HAdcBQRg/zXB94GqHPlUFAiXOIKJJbbCWKb8vWBqr1tiLw68Okp6bdg+aLyIojTtmHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772377;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XE3u2B+pN0Clq+eTAS8Vx72LY4D/+Nfyr3FEdeu11rA=;
	b=aSw+cb6XYhdKtj5MVIRa/ffainOYbulk1gA/CDnzRb336So+O5Rty0k6Q1F6AC4c1Vb2
	 bTZHaLMJL9j9uTz1xfG8uRr53FrwHdxFqLgX6C+u6P3+QRVM1Rsz/4Ys+x8FWIfeeXQRF
	 k7Q75Px1uh+au1yXb2yyHyMwOtXaxElAxWJzIbU51a3zhjeJ+ggfFMuGvVr50/8e4R30V
	 OAKppruseMv6GP3trGyid3hK5jW3l2674VfGMOsBNo/0Ql1fCUVEFXNraSZevAwESMREm
	 rGzNVNNAi0bfJl1xC3sGD5H07gPkz9BW8d1iQcF1Tn0gwSQLTyTb6qUjoJnconSdJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=Qo7L399l;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE0C606A323
	for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 19:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=Qo7L399l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772319;
	bh=XE3u2B+pN0Clq+eTAS8Vx72LY4D/+Nfyr3FEdeu11rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qo7L399l9NleUXCjnlQXkzYIlH8zOC8RAfz2zIV7GAeI4Xu9xnbXqPK48kq+nadTM
	 WvHdHm8lRIuMherfpTsMGpX33q4LXZKgV2fmz4s/NhrLpvAl7H1C6w8Iz14VBmomZ/
	 8GPkp+Ym0XpN7Lh2+Ypslp5Vil6YKcqY+QlT51ekbBtbBxAO1edNyvTr1qSTeVfoZ2
	 Hc+f22wkhvJ0aEmgrXKnVLQ1yZV+s31YaCCgJyOOXKK/KVlshSy0WOfBsQeXlxbFnp
	 frBxiSsPMbHGw9KOSewDiL+F9VbXwHb6DlCZtKhDCx+Vaa3BOloWJ5V6OwxOzgW44v
	 p00aaLIywnLoA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 371DEB220212;
	Sun, 15 Nov 2026 20:51:56 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: spacemit: k3: use com260 8gb memory configuration
Date: Sun, 15 Nov 2026 11:50:59 -0800
Message-ID: <20261115195112.32120-2-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
References: <20261115195112.32120-1-e@freeshell.de>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boot loader may override this configuration based on stored ID value
in EEPROM TLV and if it does not then the smallest common sold
configuration of 8gb is the most compatible option.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 054bfff7413a..c18680b963a4 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -14,7 +14,7 @@ / {
 
 	memory@100000000 {
 		device_type = "memory";
-		reg = <0x1 0x00000000 0x4 0x00000000>;
+		reg = <0x1 0x00000000 0x2 0x00000000>;
 	};
 
 	reg_5v_sys: regulator-5v-sys {
-- 
2.53.0

