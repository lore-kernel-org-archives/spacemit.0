Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5D145A1F;
	Wed, 13 May 2026 02:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778638502; cv=none; b=dmxbiW0tIMJBG4p/GcEZ8F2lYAab3ZcgG4VEcv0O/JK66t2/kG8MQIImKZY20OJOm0IQA4ul1A4ZFqaTcMd/jdLE45DgvHrboRpZWcpYdyGnwc2xF0HSxcTYRGl3TcA/Z2a9dU0e9nk+v51Hzi2y8PRwjok5F7kU4lOrSJ2rL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778638502; c=relaxed/simple;
	bh=wiy0UXQU4cH21IakzRIDWTSzueLEt8syIqO1JauQqW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZBzdbviLfVwThfx2geB/NONcqIGK6+B8qV5NXtQXAOl7yzjyfplJzkfhJwhUdMBvxdXKIuWThIRfi+lxpTsHQRgBudLef/4vi8Q93Xva4P5PYbKCoWFftnlMg8m3DOiJ+90DmozJM1X9B99brVzghVhaThTtf64VTxEQE+3i7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKrBUTRG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKrBUTRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87009C2BCB0;
	Wed, 13 May 2026 02:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778638502;
	bh=wiy0UXQU4cH21IakzRIDWTSzueLEt8syIqO1JauQqW8=;
	h=From:Date:Subject:To:Cc:From;
	b=WKrBUTRGAATUFJ8ot3z9w6M1JLLt25xt2Xo52UvmCS6WmvSd/K/adAj0QizF5jP9D
	 /ezWDB96v6pckR6yxZLjw7E9eb0xa88ePyPUTc9OBmAxerCWHo51UhA82TqAZ5nm33
	 Oj7Qib9mrnNgtq1XvzM+9ZVw50FRxMefTP/wYFoipO8sX1jC90rateW+f1eOcBhL+6
	 SWq9/JlmWxAhWblUzVeMPvs/BAh7sxcjlZzWVuv4cghOzHCMcbWcojqlZf79ehSutg
	 BYUSBDr+A2hVa6SZ5oUjTPgCbhbBu7q02q/nzXX2sVl4WUGQnktVM5Eb/ya5n9wE2H
	 Lqv2UyrnuUu3g==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 13 May 2026 02:14:51 +0000
Subject: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from
 PCIe
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJreA2oC/yXMQQqDMBCF4avIrB1IgkrxKsWFZsZ2WrEho6KId
 zfa5cfj/TsoR2GFOtsh8iIqvzHB5hn4dzu+GIWSwRlXmdI6/FoMXhh7WVHnEIYNybq+otLQgwp
 IxxA5rXf02fytc/dhP10lOI4T2tGImHYAAAA=
X-Change-ID: 20260512-k1-pcie-fix-supply-d12f6d50d8d4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Andre Heider <a.heider@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=dlan@kernel.org;
 h=from:subject:message-id; bh=wiy0UXQU4cH21IakzRIDWTSzueLEt8syIqO1JauQqW8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqA96gcO3vBt/WSHDDkldf2wLPX8Qt/cwZh1aWh
 Nx7BAjJQ+SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagPeoBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+04og//UEc6qtizp+oinUkZVzm/deUuIO47KqkLuVS73EOd0YlKsDUburcSg
 0MLwMAyhMvqrpzbofJTDA769TGDuXgDqV1/GdRCcmpNTkC87K1bQyUv5Sp95xfSn8tjQGsthLWS
 5wTM5xvE5dMTT7pqkn9/InomOKOsC0keXyidyXKHiFwvG4sqtZBYwaKiQtc3WTzLXt43d3bVDhE
 ygUaNQjylpQxavhCgJTii2b85O9jr6HoQJXhzDfTysQL5qT3eg1CBVhQ4+tRUrwtH7zHaIPlNR8
 iJQnPouA+ON+jygVKkISShtdsyEb3OKZLaRkd+S2rq7+NddFYzzJRFegSvegPmM4S+adTH9jJJT
 PEVzkitkfSRI6zQGtDoWwUJG61Dj+duW1ugUD7FDVwr4qmyhZHPAPndSXcytY/7DVImYviFtaux
 g3JjUr1YcvPUYj3eg6I2PXVstathkHAtOCpzx1lLdC70z2PFYBA2UGrk6UvkvqNNwz05rYo+Od8
 W/UGBz7pGhDmu1WxRHg5Rofr2CK6rGkRZqJWWcVmS3oliQmSf1A2iRwKeW1YGKxqUdkTnPo7Nyl
 s65cQiswV2Wu007BskB/f9+vWVwfAtABMN1HK7usQQ0lJFxuYyufEBx3LURyMhwDyRf5x73TTuy
 tk/zwFpHGZNa24ecKzVcRW9zTxSTDk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The PCIe Root Complex found on the SpacemiT K1 SoC does not require
external power supply, this match with the dt-binding documentation[1],
Instead it's the sub node of PCIe ports which should add vpcie3v3 power
supply. So, explicitly remove "vpcie3v3-supply" property from the PCIe
controller.

Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/ [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
The problem was introduced at the time of PCIe DTS first committed to
kernel, the vpcie3v3-supply should be added to PCIe ports instead of PCIe
RC node.

Refer the example dts of Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

I'm not adding the Fixes tag, as this doesn't cause any severe bug, thus
not necessary to do the back port..
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 2 --
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..c70081856606 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -316,7 +316,6 @@ &pcie1_port {
 };
 
 &pcie1 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
@@ -332,7 +331,6 @@ &pcie2_port {
 };
 
 &pcie2 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index afaad59e6bce..7e5915023eaa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -313,7 +313,6 @@ &pcie1_port {
 };
 
 &pcie1 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
@@ -329,7 +328,6 @@ &pcie2_port {
 };
 
 &pcie2 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 

---
base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
change-id: 20260512-k1-pcie-fix-supply-d12f6d50d8d4

Best regards,
--  
Yixun Lan <dlan@kernel.org>

