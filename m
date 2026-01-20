Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEC3D7D65
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903222; cv=none; b=QvdXA3TkrWoV5BcyX2DY5OG52ffPku9gXLBcNnR+17QouXysYsVhnc2y0ZWLf4sKAaXut7Ps6osBsCg6mBCUWE3zLuOQRVEkhaIzIN8so34uKjp/q3zSgigPjdBl+vnArFEDsyuxJ/zPo8utGGTowDUQWeijUcWI8QTnjm/qB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903222; c=relaxed/simple;
	bh=eTi2m/5UKu28W/SWWXgR/HCc7pp2L7G5jNDuhLwHFaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B83Ge5pqP09m/ainBoQ34aHq2y8GtwpnfP7YrjbL6Imz6cMyJTajQtHisDutR0tkYONOVi2LLgRLcGLt2zm6B1BlzqBink5vpLv/i1MsWaCqnqc88hf9vHxFFuiK+yNL2EgCQyKyha86ok7ekpbXpFIN8Vgf0daYHCzMX5aMVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 314af8f19;
	Tue, 20 Jan 2026 18:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi
Date: Tue, 20 Jan 2026 18:00:01 +0800
Message-Id: <20260120100001.1285624-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
References: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bdad8f72c03a2kunm541e94ba35e44d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSE8fVkkZHx5JS0hDGUkfTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1VLWQ
	Y+

On the SpacemiT K1 platform, the MAC can't read statistics when the PHY
clock stops. Disable Link Down Power Saving Mode for the YT8531C PHY on
OrangePi R2S and RV2 boards to avoid reading statistics timeout logs.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 2 ++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 58098c4a2aab..de75f6aac740 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -52,6 +52,7 @@ mdio-bus {
 
 		rgmii0: phy@1 {
 			reg = <0x1>;
+			motorcomm,auto-sleep-disabled;
 		};
 	};
 };
@@ -75,6 +76,7 @@ mdio-bus {
 
 		rgmii1: phy@1 {
 			reg = <0x1>;
+			motorcomm,auto-sleep-disabled;
 		};
 	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..7b7331cb3c72 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -54,6 +54,7 @@ mdio-bus {
 
 		rgmii0: phy@1 {
 			reg = <0x1>;
+			motorcomm,auto-sleep-disabled;
 		};
 	};
 };
@@ -77,6 +78,7 @@ mdio-bus {
 
 		rgmii1: phy@1 {
 			reg = <0x1>;
+			motorcomm,auto-sleep-disabled;
 		};
 	};
 };
-- 
2.25.1

