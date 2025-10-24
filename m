Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171236A60A
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333359; cv=none; b=eVHbNagJWdNbNng1GLWPh8dfYWx5Od0+yW8WjtGlP312KPBdGJKgxi2xWGO1B99lu8Tk53Po498eWHh7CuBHPntoihacB67Zr8aTouXv1PlxfH5guuzE2L6YT9qEL0CvsET0FWdnj4wi2JaqNIKpUmV67jIbk+Wau/r2K3jMAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333359; c=relaxed/simple;
	bh=nMCY7tqu98IJzjclxpQyavU8U1FNBOGWdu3yx7Z5f6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uualwpvD6sEdplpsJEOKOLIZ2jXcfKnUjKk5alz0GgXob3aXdVX3FFGeI109sizMZiZXkizsFf/BlSqKya8CiJnzvNQC16T/Pex2taUlPwCgAGvFfbGa5N7lwk892eYGdZi7zvJvojV7aUmvH24ULWlAQ4d4Z0Cpn4LpW+DJVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ocPIlec2; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ocPIlec2"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-93f11fdd538so99840939f.3
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333356; x=1761938156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=ocPIlec2s+ZwE4b/TSmnhYQZWQ4SVqDE3Bn6tC22j+lltskDqMaF/+1ZSceu06IK+M
         x35I2VkRg8oWen5vqVWmanFmR0/dtCXmo/6Do5YmhV3uDENEI8Km1ubs15fRqRloN+mM
         2XcEBwzV16rapo0lXIVMubU68nbFKka8rQbuwqxjqZK2+Cv7uBbda44SaFGiRTYzgLXn
         rX0VIjqNPB1KrrJFlsUvCLJzBGlrSv6EoZkeG/6hIYy7PIOTK1cR+3ywUAQDi8LjPTq3
         PxVaTcctiAqWGCqvQ8lBha57cCwBsaNmTSQHoSHs+R9sxgqUq/3LpJNfMQcoJIPoS36d
         QzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333356; x=1761938156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=dXi8LAIzyYJc3J93E8yqBaKrgkxpZYcMeTLuhsQxjTh6XvzE+tWSkVQblUUjP7xQht
         cDoV+yz+uJMEOe7GZVeLWeZiBkLtaYSaeX0UCk7WALDK8FIrI3anfnCKEZiD8gkioycm
         /O6upLQ1BzYXNfZMfFAGq9j4hQyDs1hZZupyu5YJgMHSPzPaZrsZRO67AkiDhE7T7zzx
         /p64S5nQY8++T4AHnAJ4bjZSDduVAVkwsyKjAh55s8GezZ48H1UgZGNXIftlnI5P1tbJ
         BELqHhXKn1+ri5KSdvlv9zlW7bszgtFst0F8894ekk7jil0pzWt5GuWewo7bpYt8rzt4
         BLxg==
X-Forwarded-Encrypted: i=1; AJvYcCVWyQm5Dfmd4OaytiffsWmfsShHbedbHH8IjYBzYc6iWmm8P2w8By/YKF+1bT1lOZDZoSV0/xAVNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8/WJcRzwtClcY50TTMiCIIPYiEVtwfvwggg8XcwNoRqfb3uJj
	nrkjLe4hUFbEpRuE+SiBTXi4So/E3kCaDCgJLdQx8VXLAaCIV9DmuxGXMFATD9ZCWTM=
X-Gm-Gg: ASbGncvzSdCYYaEjL/Mq6hYSWQkfqXQZZRZa4EwC69XBkc4qhccoZZ8wnJohupIMyVS
	UZ0Lo8j8nABPm02/LQwbtGR2ErwCqbrQJY+oBFcMsmHzmk6kzmy6QgV2Kr4+u+eFpxhcZzjgL9/
	zP/ffQssmji4voVVPkBBNAOvMYv9Bze5ktHybNwkbPtl9R1YJ0jx1pCaZ89tvonHZ74eKDOPyHD
	RIYpaLpCnf1h5CiOUMihH+2/BjVUIWeLx6D04Dri967a7r1fVgmP+wiJcCye32zSuYGuVeDn6vV
	pUvt0JqUjlci1JGUth48BAipPiUEQvQJjJ3dzcvJZtS/8v0FLSgosbrJoY4raDIQPxZisr3cIE1
	wjdWydKaVyZ8Q9u0Tf2pqn8cNvOz6zCjqR6tD1eWUydTNbeLKldVu5W7AE9jhBaQxnMHqOovec1
	wi9AuBEG4W2Nj17Av6cPc9ANKiN20+iSWTq7bzcsRA3OjLIiVWR0VMCA==
X-Google-Smtp-Source: AGHT+IFDogyL6cWcfQwc3FAklbFwL0iLqDuDqQppxCvEgv6jdMEMsj7R+FgIMqftII9RxRpxH7qsMg==
X-Received: by 2002:a05:6e02:3f04:b0:430:c49d:750c with SMTP id e9e14a558f8ab-431ebed79admr44368525ab.27.1761333356161;
        Fri, 24 Oct 2025 12:15:56 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Fri, 24 Oct 2025 14:15:41 -0500
Message-ID: <20251024191550.194946-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Acked-by from Conor Dooley
    - Added Reviewed-by from Frank Li

 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1

