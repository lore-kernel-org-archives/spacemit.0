Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE933019D8;
	Tue, 19 May 2026 04:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164120; cv=none; b=GaPmYPWDz4G6Y5XgCbWR/yQt+1qO8fb7G4xCRaCWcxOBboECHCgjiBu4QWtbeO6BAvJiPfWWcDCMiDEAFrjtUfPqBzxIyaBSz1lCRUp3kyIcnm+nSRud9e/jKinhebOvgGlUP17zFkoajPVUQuA7IYCvZcRYa+J1oXsTzGY92fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164120; c=relaxed/simple;
	bh=RWTtVrJ3gnjuLqtGO7opyK1BnPDwtAJds8oUZHuN+A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q07x0mwvwHiJLy81XuPcny9Pne/WNJQ/1ywC+pCSh3QDMq0hA22DlXusLDHap3q9KHmYF6rzwNhS/MoLLQIAFK8ItniG0Es0rFq9gCGY95raV7HaSrwW0onjAXDJm6Jcuwbl6nO+h+PDnZZ3tHw4ydVcE7kMTd4DN+W0Xy4wMak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=bzPpiXxM; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="bzPpiXxM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=N6k65rkOQSpxXsiGmmr6MSpGtXWt3QYbbvQ6NvIvOA0=; b=bzPpiXxMTC3/BmfdpMyoRF05AZ
	PIuWYy5YaMm04MsNErTvnV/zcfKEsKFmmVZUn3pSh8N4S5WEW7B3l9O+xRoXR+2N1oC0xYVdoD5Ja
	6Q1MtzY3qr6PC7Jqoo7G+HT1soh453rxlWCiMM4RdLbCGB+pDKFZff6qlBHGpNrlfb6PzBf9VVqcY
	bGEhBD/wq3Y8qPbsc1Z27Qj451wfqREh6iXk91+sCkxw571zb3BiMi6eoarj49PsehWeLbAgKTSKh
	e263QFxTMm26a3vQD13+HmDBKwejoCvMhs84kG7zQ57MZxoIW0fN/HGHtU7wKgjb++Grzd5ViKi/m
	zU3APD6A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrH-000000032li-2EfV;
	Tue, 19 May 2026 06:15:07 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/5] riscv: dts: spacemit: sort aliases on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:36 +0200
Message-ID: <20260519041458.3287843-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before adding more aliases, just sort them.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: no changes

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 9b1dfddf2bac5..450d28e438293 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -15,9 +15,9 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
-		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		serial0 = &uart0;
 	};
 
 	chosen {
-- 
2.53.0

