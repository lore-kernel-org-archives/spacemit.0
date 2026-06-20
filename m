Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C8374A0F;
	Sat, 20 Jun 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938271; cv=none; b=X81iP/us/Npc+KBhi84A8P/Pmycd8VjunChU/pIGaPcqRAsSSfE28q4GrpFN6+NFVOUIun1cgzBHeU7RUosybi2IV/+ESMDT29H5QAxmL68tYAQweVSz3xJnCsZIzlS5M1WKCTVUygOpqrtwuRAGj9m4JffndrR+MhENhsTENe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938271; c=relaxed/simple;
	bh=e9J5g/swbHDzjgOU31Wc2wrmEVv0k2Tkk/VI2Hj0cFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YV3Gdnbhe3JIFpRRer9P/5tj4AWsMR1RIlz9P5NqropGTX9bNufHfTmh2VqLT06alL14Q86O6ShvJe7zTI4B1aYwE/F8lN/zmdicDA4ykWLnkMGh3UQRc3bh4CYZPYPT/Fv94yCN0sl7KN0DekLsly3mH09vMnBdTyHtqJ16Ogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=S832u9rs; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="S832u9rs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Soo1HuDwKOflS4we3Kq2KkCVaLAcuHc9IrwUZyIjWdI=; b=S832u9rseYEiIUr+9c+1OhZC78
	Aq1p4wXT4KINa1nPcITe+fol/s4JDTuohEvVus7he7C1dpyfzRx07qMs1eUqXSxBbziapSnynxSPj
	nkk4UY59s61mdbSAmnfIeR8NEN3XRljKH425/0L5zW3fA0FxBnwMr4JojD/cj76Ojh/nUxD32gCp5
	3yt79oQp52o/vQIDI7YitWTO3MvntxEzBO396WTGYeuBO3DkHSoFW/i1eTMAR4fT9e5m/5IsyGjG0
	YKivAZvG4b6+qZpv2FkvBxwLWNGSICsHN6L0KwxfWDKjEEFtyEO0Ko5nqQ9DVW8l0J7FyInEpYRh8
	stAe6+Dg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6T-000000006dx-3oTy;
	Sat, 20 Jun 2026 08:22:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/5] riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:05 +0200
Message-ID: <20260620062238.3199108-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i2c aliases for i2c2 and i2c8 on K3 Pico-ITX board. This is useful
to keep a stable number for the /dev entries after loading the i2c-dev
module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 0a0c221c99e74..bf64b6c6f867f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -14,6 +14,8 @@ / {
 
 	aliases {
 		ethernet0 = &eth0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 		serial0 = &uart0;
 	};
 
-- 
2.53.0

