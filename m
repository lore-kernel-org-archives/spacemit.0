Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D853F3E6DEE
	for <spacemit@lists.linux.dev>; Wed, 25 Mar 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455845; cv=none; b=V0qNzaraXAJhb05txorA0KVuldVv4tMM8mdSh9w0e8d3Kdkhn9CiVEuhHFWOeJC/gCaJyrKOtO/nnuMcavPMUJiu0JJ3/PD3HfCSdsc4z3LEsvNhMtpnml0R5ou8jPEbFmgECZvNosHdMq9f6hnglocHg4XNM9ELPZ253F9hdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455845; c=relaxed/simple;
	bh=HX2kS2CXlof3uu3i5x67Qry8KYMPozu4hVnaRzMVy1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dktq5Gk+YeQAWqIwdchS8rP0rLF1yMg3FtOwDfs42UdxP4mxzhM4UMzLFXOGs79tLUtVWYZgEBtp7Ncb2CoLWHHQYgd/iAAQ4DP/speSrshpdJnPa+H0/pD1/YFIDxen9tAHV61LJbTw3ScjJEY7fVdAIQjLhwV89QN6H5Kd9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+Xg2sHx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+Xg2sHx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829781b2b01so18176b3a.2
        for <spacemit@lists.linux.dev>; Wed, 25 Mar 2026 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774455843; x=1775060643; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qbvYscf4zAVK6F+BRBQCeZsFQW9PNBr6bbrHWczJms=;
        b=a+Xg2sHxFm8Bo37EUMONT+oSJhWXsePlNWIPaybkke6d4q3R+wC2pMiitSfWmTde8k
         xgneggB0LOLuhCjLPP86EMzzDWCGs109jErVMnwQp4TSq2Hm4YF5ykvFtcgJVRRyWDVq
         m85JZ5xtwlucaHKCbBWNnPlCifqtaMK7Ck6utpePSaXrPdMPo5eu1wxpfPOOuBwVF88L
         yJzoM9jOw1KLdtQynJcFa2qPQoVfv+X6ZQ3GgHA9qElSXEkV9dEH+BA2SLHRsJG7yQ12
         KcGhft4zeFFzfd1utj85ZLNMuTUJ2wcG1HRFN/0yQBEXqSZwymNeogHJqKESsuTpr7pe
         YdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455843; x=1775060643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qbvYscf4zAVK6F+BRBQCeZsFQW9PNBr6bbrHWczJms=;
        b=krY1qANpxXhjvcU8k+iSZ+hTqPDB5NCr1AtO+VC6uAjWQt8HETp1p158kOgswtteTB
         8dpT5rXNOMq5rQIj2Q8jA4rvxUkH725okv01P5YkwkCV9klBJG79mxoIZsAG/NK1w7TY
         p5FB8yEE0lB61dRa39eIkRVXm4qpFwNz5uJNDrZcq1q9FDjHfpgroIpjWhOQ3/jcvtUU
         Uw6l4UiLs69D7xOK4XBzF0LnNS6Snft9bV763ysz9J6NionsW2CQED/M8xbkdTT6fWm+
         MjhDUpXNhG/cJ6SoxpFemaLK2u08EWAEGESh/kaGQFEnLzlN3LB0Iy8DXfA9RyZxzGZt
         3xvg==
X-Forwarded-Encrypted: i=1; AJvYcCUdnJfxiiqI+aKFCzt45ZYUHZ5BMhgFkZ2AXQiDmJdADIRHg2DoIoUEBkSLFE3AQoCSkdyhumx5NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcchqNIgQCjKyB1ElFz+GMvLfXamfaQynKyglzZBl3WteTdrEy
	wJbnsnJ8xab4CMGYrskG72OD7RkpPotuQzpSIoAtEE97ILyXjkDVjiGg
X-Gm-Gg: ATEYQzwhlwey8VgBIeRJ3EbQ5jjYOlNLwAhY6GFO23dkv3EgJ08wQT+EJAlJJFesfmk
	0obAFsgcR5YoJCgZjF4AxIExAFGw/MEGWJvzM1qJXZQ+wVBwrqp3jvn5LtCtFMv04DQw60E4hQT
	Wn9VhFwC9IQvp9iGkBGqJortdkvm6TxMZ9qre48+UbngJam090nAhbq8LoN47EjOeNev1u0WLGn
	DVl0gXxJbKf9+OyDxR6dCJK5v0lL0sY7zduwpXqHtEtAI0X55ZsV1rNh7zEdO3gMuj9pkD5ZXUP
	Dat5Cjo7VLLft0f0q+PtdbrWv8TMNKKkXvpREDfMLoYI8BPKCEP89Ru8aqi+8U/S0i7xjRKkQEI
	XRhCQxrBjZ7oA8+WAmUOhAuJp0zMZ1CjkgnL8JCl0CN5b1JHid3D3V7zFO15sBnEAMpw1J1Vz/8
	JfPILejCMi0TaHVEryDBet5woIlrIQpL9VknYB
X-Received: by 2002:a05:6a00:414b:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82c6de927e1mr3843698b3a.6.1774455843050;
        Wed, 25 Mar 2026 09:24:03 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3fe576sm154141b3a.54.2026.03.25.09.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:24:02 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 26 Mar 2026 00:23:58 +0800
Subject: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB0MxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3WxD3dLiJGPdNLNEU6M0E0NjM0MzJaDqgqLUtMwKsEnRsbW1AEl
 nPspZAAAA
X-Change-ID: 20260326-k1-usb3-f6a52f413616
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455840; l=994;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=HX2kS2CXlof3uu3i5x67Qry8KYMPozu4hVnaRzMVy1A=;
 b=sSdhxxaVsPk/RdstKNgVGGb1XcCzLpe10MvOCK2PNP2EgqoJLouU9wzirIXc7obo9ACJIFgct
 lGVdOCDrwH0Dluk863nVDQj75lYZPTyRtb/Zqo0J6KxN9VFH7fpY6Kq
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When clk_enable() fails, the clock was never enabled. Calling
clk_disable() in this error path is incorrect.

Remove the spurious clk_disable() call from the error handling
in spacemit_usb2phy_init().

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 9215d0b223b2..e8c1e26428a9 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -97,7 +97,6 @@ static int spacemit_usb2phy_init(struct phy *phy)
 	ret = clk_enable(sphy->clk);
 	if (ret) {
 		dev_err(&phy->dev, "failed to enable clock\n");
-		clk_disable(sphy->clk);
 		return ret;
 	}
 

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260326-k1-usb3-f6a52f413616

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

