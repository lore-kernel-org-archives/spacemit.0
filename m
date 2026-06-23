Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D23A7F7A;
	Tue, 23 Jun 2026 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247481; cv=none; b=JHDxQH5kkrfeMJDVzBGY9oTVAQyGAPt1BM4C0AwqkbGvVwc1qqxS3YfJW1QdWurzpenD+AZC4UzZKEPWWrYQRtPVBL49Qzd64rbRagervPJ4hmfZG4l+cEsk9jP7IVVk+2gYjTbov1w2PnbfVBcEo2jvZFu3CoM5sWsVmS5I1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247481; c=relaxed/simple;
	bh=YEL/PgtG9CJxPalkrRDkd4g6pTV9pVtSpKYqOFpW7ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxJW6DRI7puPwLK3eY2fToLvr3kJVNPInrK6HC23QpwAu2koAr6ehQuhn6ZPbFK7edpDQbupdJF+MFyI7TIjRqKPWZcAYCDrDE7cnDcOVRj/ZXK1vxWO5BwUAN61+X02+8ARHFBASE7ja0ZWvGAS4/e3gYXPqYSizUnBid4fmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=NVPdjmt4; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="NVPdjmt4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tROYkmU4fHW2liLJr2fdOl3XmpMuw693HPJxJNUuxvE=; b=NVPdjmt4Kqa1fWDeGjrZy8N9jX
	I+BQuBYal8BPy/wV23Vm9aa9s9Yuw13cla6PKBGvFyiU6qNPGWPKor5fUCZkfQ7D+De45FBPddj07
	ZupDrsTB3yWToupDJalRhXuKh4GiwQwVmGHV9Ma6Ic9jQONsF6ejfXfzkvLMe+IY1ewU8AcQAaXsm
	8699im+Y/8ufHnXoNU00oHj6GnTK65tTq+vcCITyhKlvnvGEU3Nm14hnkU1Ykt8EiqLtiRZZBrVkh
	xpBjZgtgL152k2bFwLfUgi0qQaqhU9fgsw6HiwPDQyf4A7lzm/JfrzCVZfl4/4El1AuYPZ9dGteyM
	FRN6hECg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z4-00000004gOu-1CDr;
	Tue, 23 Jun 2026 22:44:38 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/5] riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:47 +0200
Message-ID: <20260623204431.498700-4-aurelien@aurel32.net>
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

The K3 Pico-ITX board includes a 24c02 eeprom, that stores the product
name, the part name, the MAC address of the network interfaces and the
board's serial number. These values are also exposed via an
onie,tlv-layout nvmem layout.

The eeprom is marked as read-only since its contents are not supposed to
be modified.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 5fe9041ec5702..0a0c221c99e74 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -47,6 +47,36 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_1_cfg>;
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			part-number {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+		};
+	};
 };
 
 &i2c8 {
-- 
2.53.0

