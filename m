Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2B3A960E;
	Tue, 23 Jun 2026 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247482; cv=none; b=dubWCI4EZt4IRT8hChy4bMAppk4VXrWIOZDh+f7rmeJdYla/qOBoRG8yo10megM2pAyZ21bHBRTHBuM4k2+mkLk8528CB/DmHrFMHmfGyU8ttvejfzbSl7CebehXXEw9U+4xUIA3Kc/1C4d3Gu13hBT95UhoAtXWCj6PgouZ3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247482; c=relaxed/simple;
	bh=e9J5g/swbHDzjgOU31Wc2wrmEVv0k2Tkk/VI2Hj0cFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYiI8yFPPJSjbVuWwwC3pCXPDOZJzjAHKvOocN168pLHF09Zoqd/Gvb4f+/QI3OGnUZOnuRaHCrJbaoL95qOcD9IrvhNSPuOC8bqEk1LLzrhFDIYRbS8hTO3Kb9rpH68UNuC/mNvwm0Ox0J/uFatQCRYCPQITFHr/7geAttjhK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Ce5Z4mXp; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Ce5Z4mXp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Soo1HuDwKOflS4we3Kq2KkCVaLAcuHc9IrwUZyIjWdI=; b=Ce5Z4mXpSXVzV5WQHpSoInL9ZO
	yAnMOQOImQ7Z8j5ifwRh7IYaaytHxKWB0MfZPMpeoqTAjGoGM4Y4UozcQ4uqgm0hK5dzuQ3hus5uU
	VnXPGx9DTu0QcPoFk81GwJf2hHrUd3sySWrPWuU0RL2gvfAxPi2tRs3O/z5x/ZswY/bTt3Ah8E4Gl
	tU06VbNIuFGtC8Y5dGfGLC8L+QrLRmv8P/kFQyNcRm9AS/4n6zSk1sCMo3Asm/gT/Tya7GuFtQYq0
	2YI6wUANT0ZL9rjGe5ZkOK8yuPYeGZTAXcAc5BbP7SeaFD54gfTBH9qbIZmVbQSYP49sprYIWY6oW
	BzmLE9xw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z4-00000004gP9-3LXo;
	Tue, 23 Jun 2026 22:44:38 +0200
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
Subject: [PATCH v2 4/5] riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:48 +0200
Message-ID: <20260623204431.498700-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>
References: <20260623204431.498700-1-aurelien@aurel32.net>
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

