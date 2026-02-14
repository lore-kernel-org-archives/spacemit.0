Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B923AB9D;
	Sat, 14 Feb 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072182; cv=none; b=Jo6la9Bkv8mf7zdXpJG/kfZx1m8ziWbNNMnPnh3RFjgXXLib1m896i/J1MUa7QKyY2LCQlsF4M9h+QBbYtSNYGYei53LDN1W4R27c7LNdlWf7q0gp/3CmXWyWrzSJdvvV3XNpuV7VIv+1w+61i5K4m5kYEfPq0g859IGLQFk5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072182; c=relaxed/simple;
	bh=VfmU0lUs4Slg/JGUcPBhIcqCQuDwGNKonQhkwpcEyFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMZEyOephKj8vxqbJBRyX803/R8i56KoDEPQjONAuxWKubvXGaR40YwFK2X0gPF3g2IogE8bCg4ZUgImgh6S9KelkXbHGONA+lUHuoUWWHYGQBxHFHldp3Yob5C9eOU80dcuzP3180D75PyXJfVc3w25FDExJxph5sYEXrxxwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYYvjytU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYYvjytU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A2FC19423;
	Sat, 14 Feb 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072182;
	bh=VfmU0lUs4Slg/JGUcPBhIcqCQuDwGNKonQhkwpcEyFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYYvjytUAC3NXiq0SGPRURADH309yF5j7sKkzD2FZaggGJgm8SL5TrAOjM2npwOnQ
	 NtCJc2SPVPfT6hTnYU6LIrzWuQoud5GyO8IAy0E98UxkuxnuIaobTxyHqnO94w7+oY
	 iWmc87Tx02GXtrEFVBOHgLLCOLl7MqRg73d+uW0E0A0TiX9wyiG76lJ83WrlzqvKe/
	 FluisyammkRfQTTGpHfuYGtUrqLF7tSH1IALKM+NnHaJr5A7gJ/M88ibFIHJ7TGnLO
	 OefebFD1QvZH1VGeHHjN0xsw1WW5+xC9bNoP929G8r+PrQ2fKjIrKGVhPvUs5Tu67o
	 xIS54AkxIXTlg==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 14 Feb 2026 20:29:14 +0800
Subject: [PATCH v2 1/3] dt-bindings: phy: spacemit: k3: add USB2 PHY
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-11-k3-usb2-phy-v2-1-6ed31e031ab4@kernel.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
In-Reply-To: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VfmU0lUs4Slg/JGUcPBhIcqCQuDwGNKonQhkwpcEyFU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpkGqk74oeID65Ro92lCV4S1UmpfWqKztQkaHpX
 wm05uUOB8SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaZBqpBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1/NQ/9EPpkiSAM4flTUD6Z54ieBpT27zD2O/Qb/o94Ub7O38OVWgKEjffKf
 IjF3QC+Yg1CC9uNhzolxccCY9Rd61lqHh0gYSvg223HNztJb/3KVIh46dOvdeOKRHX35z87Buix
 0jX05MkKsBUwj4ZcoWo7+DCMx4GMl3vOxt4yYUT6YMFh/hiZuHHZPh7f6BSBPx/hvxD0esP7e6U
 mAt6+Zss+ge7WzmP8SMGDaO3CWmB1LXysncj8D01AUx8tjUn8ljgHfAJt8yLThSlyl/nROZyfHU
 iWMqXzpF4n307jNO25kRLQ0x+Pa+MvqFmI/bcAoCZbzGG2j3mkLX9Fx7D1n6IkCdFBQ09JsdAKL
 i5CLV8twPoBw3ZXPXxUI7yzRgwnT4z+EMxGtSWlL9ALW7v+BJFVmTOTVbgxdqqE1ZPnvDl7LEW8
 Ol5Qhf2M9GWfvpbJIGKHUe90RY+oH6yMRB3Av4p+DyTI4SIjt/qRHLNh8GKOf1GpR+/YU1Y4iak
 yNHCxOHVqRbk6WYI8ItFQ6jeTecqG3eFDH2arZU1QHs+0iiPY0nh0fFXaKkMrfjl0Iy+0VEdMqt
 gJQmltBJikJY2MtIGq/idMcc50gf4tRa/0oIOdcIUs2k/GnxiB55FXxwLgZbhFHl+JkzCa6VNXk
 zrxYjLgmq1unKCr4cZ0o3gHkQOhQd4=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce a compatible string for the USB2 PHY in SpacemiT K3 SoC. The IP
of USB2 PHY mostly shares the same functionalities with K1 SoC, while has
some register layout changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
index 43eaca90d88c..18025e5f60d6 100644
--- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 SoC USB 2.0 PHY
+title: SpacemiT K1/K3 SoC USB 2.0 PHY
 
 maintainers:
   - Ze Huang <huang.ze@linux.dev>
 
 properties:
   compatible:
-    const: spacemit,k1-usb2-phy
+    enum:
+      - spacemit,k1-usb2-phy
+      - spacemit,k3-usb2-phy
 
   reg:
     maxItems: 1

-- 
2.52.0

