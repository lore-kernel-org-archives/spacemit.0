Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5B21ABC1;
	Thu, 12 Feb 2026 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860357; cv=none; b=lSFYl9+SM98JTy2boUG+QWrWP90h+wkkws87DR4ggoiOOOKEzS0Q4TG28yK0dQWRi9qqPPUq6WnSg6DD/38rZnLWAjI6SDjWICJW66CvLXhxT955clQgBfSTZ6mXOwtLLK5VCy39gElvZYO7+WBgCKdpHQVu/4NXlYMPz0jPF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860357; c=relaxed/simple;
	bh=VeholSffT/UMyhEACirshDrbCKDpTWyBnxuxVdBUr/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5g+1BYT7PgGgBuPkAzqpOBOuIocs2tlAuzmKa72vhOWSHYtaC7BZwloQkzeAnuPno6Cu3YtHn38W0qaYl5nmPd2LMBHHgfWOVlzOoO29Aocu3lMUJLjPofKGCvEL4rb5QSyUIHqOGw9ZgAjoDushvql6uRABlUxH05rs+BDyiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJFMkekb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJFMkekb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E57C16AAE;
	Thu, 12 Feb 2026 01:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770860357;
	bh=VeholSffT/UMyhEACirshDrbCKDpTWyBnxuxVdBUr/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KJFMkekb/gpw+iVZ4zFpjfyIj40fK9OJOeNklaJeprIum6E+l7NCmbQDu/YGY1YoM
	 oJR2er3OHh82lGnV47jvk+qz+U+z3/rQGpDV03YFemgMkj9fqFu97Y/2EHBRbqC6Fn
	 3j5gri5h6JNrkXJ50wP9mtCPUFVp5vCPDgYpdeN+B2mUzifKctRr0l/MYpEeWt3DGI
	 z2CUJFhDMGYSOIG5r9SirK+lZyIN1Fd3YKF8BqDVG7yOfQCaFzRhrtnR2CpaRizRjY
	 nVO1KAECeXC5NJ50bq5hRiRSEhQQrg618Z8BPLMBXOzswLbEx8yol+LhZmrNMoJUgp
	 3qXgDhndD8eIg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Feb 2026 09:38:55 +0800
Subject: [PATCH 2/3] phy: k1-usb: add disconnect function support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
In-Reply-To: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VeholSffT/UMyhEACirshDrbCKDpTWyBnxuxVdBUr/w=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpjS83l7LIBz5j7b0i1Mn1HREi55NVap0spyWjR
 qFR12iKDH6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaY0vNxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0acA/8DiNihXAyofvNdMrH+2sgLHZcWc0P4+l2zGse7N1DqHhzTMCJQmQz8
 AsQkj/JF96iZ6LsB+ruMJLFuiKyJ7cDoHpsAe2nWMDSp9g2C59c86xu3RbJSimk+vCt7/2gkZLv
 XmloMWH+dUqnKitXxCt+mGSLdtNe/9A4F1RBT3i4TBmbyH5YcPBk8aFCE99HZRA2tUHZxY308iV
 2Ztwjtveq68uF518L3P0IYO36QszZEq+zDl5eriaLTNfQLqcBu9whDbBUxKxBjF+xnn1Rk2t8pZ
 Xcd6/QdmDvRJrt/2xaYGoDHvHMAS0AA7K3fCeRoEhYoLguTc0DtEtnXCLt6E23Hu9SGXbE83CgP
 SdEfj9gfAdATba4vOEg1PXxOMl4mxVBE69E0A4F8OrMVPnOGgv55LAgeaWykGe//2qybaEumu/K
 YhbeZLPrjKs2p+LLQTvL6WbDaYiFK5ktkD8Kg1cFG+RONxfUNYt/j8zJ2LBx1+ixJtktgNX5X9O
 6n26mmRrxc6kNV1OTAL+zZ+WVZsZa7pRRescgml8W6RStIyowZDAQGav8iSHJQFdZmRHkrkmM+U
 eI7+WDAZ11uwMq0RQ+bSaOKRc0LNq5ds/qYOs+8F+iHXkbWxHnlS/8sElOZzTlKelvczzZbtbHO
 TKIPHrl9L1ttmZ5KFDwTITyg+Uuz68=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

A disconnect status BIT of USB2 PHY need to be cleared, otherwise
it will fail to work properly during next connection when devices
connect to roothub directly.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..959bf79c7a72 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -48,6 +48,9 @@
 #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
 #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
 
+#define PHY_K1_HS_HOST_DISC		0x40
+#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
+
 #define PHY_PLL_DIV_CFG			0x98
 #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
 #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
@@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
+					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
+
+	return 0;
+}
+
 static const struct phy_ops spacemit_usb2phy_ops = {
 	.init = spacemit_usb2phy_init,
 	.exit = spacemit_usb2phy_exit,
+	.disconnect = spacemit_usb2phy_disconnect,
 	.owner = THIS_MODULE,
 };
 

-- 
2.52.0

