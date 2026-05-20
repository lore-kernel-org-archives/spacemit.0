Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89F3D1CA2
	for <spacemit@lists.linux.dev>; Wed, 20 May 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275574; cv=none; b=BIo4FX8xj7UcXZlDl8fqIeJjHrObhK1cHJeHRqgV++DM/XkmwXlNwB7wrZclz/OMikMyTxcBxZcu6GRA8D4OG6Rs1riJ+NgZjdilvPU/wJjP+1p5zDYjfgmnKaiOoit47X8QTfSDMk8IcB8bt0ZKpB7IiFo5dNLijF8dVZ7G0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275574; c=relaxed/simple;
	bh=/5mZ4vEYwygrUeR+eebBg7UtHWLg/gMI2VfnFbye610=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=EAtfs/80aYFiz6l39cJjui/1ZE3E2LNzL8O3Mi7GMLHWqQIrosMnhPrg0GX2B+dlILfYNFdqz82ZxmveOe/AWoVWQQAE71DqpN6aua+t3JcxOaBszbPGjF/wkNwr6jY+FAdydrFwXe/jb3MV3HwHC0kF+QnZLvHjKoP18O0rGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHXLK19Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHXLK19Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779275572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
	b=HHXLK19QRhEe0gyaNTXqZw1mnrnfTLycQoT6zbNZoTCdgbn54zvEdemW0lxKyCwOdmc1pk
	Tgisf9kCc1rQhS+1hij83qP3p8Xqfp5TtHE9wTW/g5AAGiUJv1nodhbgaj+NE13KDAMZp1
	LC56ATyqtns7w+uKvhR0hewHHXOfCKY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-QNlYQP_aNxapcAR7hGS-Vw-1; Wed, 20 May 2026 07:12:51 -0400
X-MC-Unique: QNlYQP_aNxapcAR7hGS-Vw-1
X-Mimecast-MFC-AGG-ID: QNlYQP_aNxapcAR7hGS-Vw_1779275570
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so194865751cf.1
        for <spacemit@lists.linux.dev>; Wed, 20 May 2026 04:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275570; x=1779880370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
        b=Vuoki/+s0ee9UXyEztfrgn/Jlq9P1B9YFCeZrqfUwzvNeQLllmWmPQH2rUZ5DhBk5O
         SkKEiVRoXqTWkuUdv7wPzTjZE+siJOrUIFkWKFUamEduMsVjiPKzi41QjGEwx6uJwEmn
         n0tflvG8JmPdut9BO5ePQOtnOiwpeoSLTGCPzfEF/2IbhqlJG8bmyvP2FJkxKCktHwLZ
         57C6d5+JGHU5JpJAF+U9U3jgp1bYE5QZahGiDNZ4A2haof2OwoOcFD5SwnH2Bkg8FlNY
         LbSfKM3hT4ohQGbnsiX0j3Ko1HWwBGiOD6m8wll6M1PFJudIS1qPWHWlrHkk8xZ0nl65
         z4kg==
X-Gm-Message-State: AOJu0Yxbrkdzy4LxC2w3UmTeB9cQjbh2bBOhMnpjdFaP/2FGYxLT3pC9
	htkK0lWL0lFL4xIamAx/bGC4TL3YWvY190Wxf7mUmjRKo8E05tdvHaW5pTTKpveNAEgdAZUKo8Y
	rb8FKXIqaYZk3AKH43xWWZTC4tQWCHUeHBk83ONX+CHA8waF08kGFQ5epLhuU
X-Gm-Gg: Acq92OEA95e/qmzT3Lq2czQEvsGpirXnQvjJJfymMbBInl17LIfi5T3/OjkVvO9HbUp
	Jt3SyTYHlbWe4xIf+Rop+9E+AYQy/hxydFSz5LAjATuIUjwzbIMRBYE9jfnfiVBfQzGv7Q01YbM
	RIkQthKrmiHFxBS0w01zjI5W/FfBzRzJfDHlgboj1d7KD92dCyMbyKQpCSNKZEDrfF6Z2kkk6Dk
	LjE07KcxPShNpgaWeJPm3si8/f54XQeShgRuJQWR3J+Nl0ao60dJMCZ2MAXiu8O100MvVsCuOg7
	FHEuBx0dgpr1MQJ4KvqHOWXEkiYnveVNHeaWSYyaLYe+J3gS46FjyH0JaLtI3sZXoQ6pReSfF6Q
	x6iR37ew588hw
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308794501cf.45.1779275570381;
        Wed, 20 May 2026 04:12:50 -0700 (PDT)
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308793991cf.45.1779275569917;
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
Received: from rhdev.redhat.com ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360979c2sm119479176d6.18.2026.05.20.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Wed, 20 May 2026 07:11:50 -0400
Message-ID: <20260520111150.3300707-1-jberring@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KeXHqWf_WIx65qN00KbxvEK3TvsU9_pYEOwsZkBJbC8_1779275570
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f30..07dbd292eee33 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	pcie_vcc3v3: regulator-pcie-vcc3v3 {

base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
-- 
2.53.0

