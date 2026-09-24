Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573002DF6E9
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 01:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214833; cv=none; b=bSHxu8JxWbW3waysfS0tx/Cw5n09ssvoAJrMO7ADbowJyP0QZNL0ADxex7FmQwDzIlp6iA5nP2AuVT1u75VTROVVCZS+5j9504ZdOUZsjC/p/ZNUqVAwNICbfjvp10u3UdVXPkR13uGmuSjVFk8SpD69Bv+G/kl5BrUIQZd7zCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214833; c=relaxed/simple;
	bh=ZGYsc5FFTMc0cXDw8M1XksRbve//31AZNpv00afVkko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0U54LC2tnUKW81F2MBGMsDgIz71jC+4/XnkgprCV8jCSXErvtdHrhxz8v0hOv2ikNC6bYog+6GFw701bdB7cMdMpbYWgB03Wy21KYHQBCSeBPMKEF5+wxxKcg7mqu1Avd+TFld1KAHfFuQX0Kkbu9KJDFhQFTDoZN4VcggSnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceYiUCgr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceYiUCgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC251F00898;
	Thu, 24 Sep 2026 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790214831;
	bh=KxUZgygbD6pzvkbZMV6HMcwciRjDi37XPGhTsTHCYgA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ceYiUCgrJITmNNrEVXD3qYj0kwbR8w0usHRmmukZPbplH1hnJ+m1cRLQW9R7k3xjU
	 tSaRX38x2bGIfcQW31uoyxGvxEUz1k9zAbYUht2fkkTz3Gdd24Q3JtzAbuzzvviUXX
	 z1BfbPJlz9sf+Rx1Fv142OyK75qcQGbNwD9Df4/OXmml2zGyHjL/p7z1GWeUNIt/AF
	 E2QDdh4UluHQ4GfDJHzXnX4bb5LNxZNxvUW6F0qrJwm320tZ65BOLgg80DST8BEmBR
	 jmtqKYVSuc9rijbN/xedRNki8Et/jCr+FSKmUCW9rwjSHVqJTw8rw2ot3l1ZjOIl7T
	 fEHwQGVzdlGXg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 24 Sep 2026 01:53:30 +0000
Subject: [PATCH 2/2] configs: spacemit: k3: Enable Ethernet support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-02-k3-ethernet-support-v1-2-b8e1fafc9249@kernel.org>
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
In-Reply-To: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Jerome Forissier <jerome.forissier@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Peter Robinson <pbrobinson@gmail.com>, Johan Jonker <jbx6244@gmail.com>, 
 Julien Stephan <jstephan@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ZGYsc5FFTMc0cXDw8M1XksRbve//31AZNpv00afVkko=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqtIKlrTaG4KKAcsHFqZoFWcKak7yTQh80DLd87
 Zj9X37qE66JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarSCpRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2ZZw//RGsAHTpetOHqIreh5EztgoniqzleooqR2xWsGGoUfHHbVeYzYXDm4
 YUuJKQnTTWg3K6A9ADZecxpQv/RG68MVt/k6jmmHcUB5E5806znhuPGGZD7a7GRtQccztH1XD7p
 DRFfrStASytv/UE/OCddDBDj4lXZGYWEREY2iixoO3SfDlqfP6XWYCxfIl2ADIHOLb84wteYL+K
 ce01fXvPDXrPSIkXNwiu8fQyG7afpd/MWQNrGy1jojStXbwMcwnfjvBjWHVkhFyrC7xyK8qKYkE
 3litZeBcN5+QaWPrxAPgYgInDUAJZFc1JWlx6h1X1cX/tYawUh2zzlh6yttHoi4EBin1R1l+ajz
 htfgHMnZ9mqPRDma8NLziuUDd0JxlsUcJi2UQbHDEv7ny+BCaw7mXFzCPW6EpGbNyt34ax+BuzW
 224IUedtAtuM0Q4kC23eBDhe1h1z7f/NPN4DCz5XoCF5eg8DxiKWt7rutmgJzX6w9Sm7feNm2md
 AF4rAHmoq30TMYpb0YlI4KVSUi21juuZlBcSLLPZpl7AjRwGH6oUPt9IcRMA9nQUvtX62TpJ2BV
 RSpxlQlv5T1ve5yvbIms8Vxd83abgYjS1erKyA1ODFzPiLiM0ibYvVEH+2ks91aW9agMOvqjM8i
 jS/QDj+aHd7yIGSEKatZDjaVj5IV/4=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Enable the SpacemiT platform glue for the DesignWare Ethernet QoS
controller together with the generic PHY framework, Gigabit Ethernet
PHY support and the Realtek PHY driver.

Enable DHCP, MII, ping and PXE commands for network configuration,
diagnostics and network boot. Allow U-Boot to generate a random
Ethernet address when no valid address is provided by the board.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 configs/spacemit_k3_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configs/spacemit_k3_defconfig b/configs/spacemit_k3_defconfig
index 6ca41aecc41..3a70a0a4858 100644
--- a/configs/spacemit_k3_defconfig
+++ b/configs/spacemit_k3_defconfig
@@ -24,10 +24,15 @@ CONFIG_SYS_PBSIZE=276
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_PXE=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
+CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SYSCON=y
 CONFIG_CLK_SPACEMIT=y
 CONFIG_CLK_SPACEMIT_K3=y
@@ -35,6 +40,11 @@ CONFIG_SPACEMIT_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_SPACEMIT_K1=y
 CONFIG_MISC=y
+CONFIG_PHY_GIGE=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_DWC_ETH_QOS_SPACEMIT=y
+CONFIG_PHY_REALTEK=y
+CONFIG_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_SPACEMIT_K1=y
 CONFIG_DM_PMIC=y

-- 
2.55.0

