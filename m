Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A73411665
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034450; cv=none; b=er1Fs0ILPoNrQJYj05r/PehTmJvYmi4srhyKgmnROMtNhwihAjNbKXL98VcjT5xBJeBXDSTlxODcadHJLz9IqPK9ECp/r1g6ojvCnBpTjTTNGDKO2xjRyBhFjsrQKttC076GS1jFU78KUNzMM91/qwtazoX3FJ1R0kXnULvFDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034450; c=relaxed/simple;
	bh=+Pdfi70LkinVFTovJkzCSbIOzEBbKyNKWMr5FgCeZf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gun7bq2aGDuZtewhhmOdPZ9+vM8ya4nRwRrEvUCkWZnYtAfIvwr/AXNdL7lhRKDVRKePliRnc9Fnei/f4Iw1c06a+IIbfpYKVm1bVBy4JAygUOmt6gseE17wBcn2yGRDvzxv5+87GEaU2H0/Pws0x6uoN+TgQ1zzaapbLaFNxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTIjYbsb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTIjYbsb"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so2256693a12.0
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034443; x=1781639243; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=LTIjYbsbA6AkIGIUlcaLrADsK6H8tTUJR8LwayhHNDIkZOMrf/2gARFfwlBcGDFR2B
         h3bp3dAvqcnX1T+j8PZIkwqfFqz0crmwnXY+5SBJMqqskbXk42adSZGpnPqeCgC+rv/L
         8qJCrfH2/i95Lu4nzZP+2v5fIRBCqMpOy+w+cF07v3PihgWBrr5dF+uz8tzSIOpQ4gf6
         li08H+wT8/UT3eF5569vAnpmS8s1blJ1oP7UOepwCEz/0uSu9lyNRsdk8+Z76bWKT9X6
         fm2MR5/Xv8LtYQVg+bTT0GecYsB4IZ+p/OjDfBeZxBw8F/mncEP14VNq1rU50XqTpW7y
         2r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034443; x=1781639243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=J2fiXExUqMak3WELmTGqt2JqGRK9zmRq1xFgEh04G3fiCADatvZvf9U/cCEhbCNVg+
         nbaASiWLcLghVMH68vGQC9FEGulMLKCe48hSW2ULVEGOe/O9+BnaNGF7/lQPPzzZyh1o
         HiCViD6M0OIsbBxJA5KWySnTmhubPFI4qlaG/BAxJrro1st8T7HvyrneZZx5rRH2PR+x
         4w48tV1LzoioJTOdyLZZusLFVMLEN0VNM9IdRfUQzyqJVEF0RsxQ2UKi0fMC8xMGh/wg
         YmF8aJJCq0sEp01uEC/svAqAHf8237Z8mZTkR8Hn+ivQaInBstugUdHToDQhrPOjqeBX
         bKHw==
X-Forwarded-Encrypted: i=1; AFNElJ8fdOgHaoqge4jP4kxHMMz+sV9+9JzD5vijWgUZglk6uco2rdvl07GWG5jM78WQBxYclypLxzjzwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwMtmiDnZOE8npRzePJHUajJ5zQutC/7+gdcEJb0OVGuTKthwl
	GQLKLzOSljO7Y878WsyCH6LcJl35pXNm1CYpQKGrMYWs0VbiIjVjo1r8
X-Gm-Gg: Acq92OHbeWAJpZRPCAqNFb6ygZVolYqNWkqKmra1nrVJHAYl6ZIRlo+wLi+UfE4TnQF
	f6iDirUon1fTc2Z7QHoRzrDEAe8pRLyL3u/racy9lc9wvFfO4eTaX/kAFkyHpct38zpl//PIIn6
	j6tZrff6q0XVwWywcZJcu9TIBJGIYtqClXT1pR6+PODRn36uWgtkOzl0pPHTXpvD44QhtllbMof
	3aLBUmivbt8f9DkYkDDrkA6W8pMVdlbS4x+rsxWqXHYIlS6E5V6VF5DUtKr9QdYl7D99yKGw0pa
	IO8iZynnrU9CcenDWvZi5rezw9fwqbIgHIje2MWh+h9vCJr/pflPSzGBxPMu5rYgB86pSGgLEGz
	Z/yxbvXmVxoDyabCKP9DSkjX534I3Tl+LSEebtUkYchVOa7852YRivJ2B9G7HGdBHTt7zan1xTo
	/ZQmvNF8W3
X-Received: by 2002:a05:6a21:3949:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3b4cccfde39mr26226941637.5.1781034442949;
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: Add SpacemiT K1 PDMA request-number
 header and use it in DT
Date: Tue, 09 Jun 2026 15:46:37 -0400
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1tKGoC/4WNQQ6CMBBFr2K6dsy0SlFX3sOwKO0Ao5Zii0RDu
 LuAB3D5kvffH0WiyJTEeTOKSAMnDu0MarsRtjFtTcBuZqFQadSYQ3mAu4TOeQORnuCNjSHB0al
 cO5RKu0rM2y5Sxe+1ey1+nF7ljWy/xBaj4dSH+FmPB7l4/z4GCQhZqcz+lGWIub3U3vBjZ4MXx
 TRNX5UPZW/MAAAA
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=+Pdfi70LkinVFTovJkzCSbIOzEBbKyNKWMr5FgCeZf0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3J0ap2uYnpxhcd+dxnzdfc6yC21LvXott9jc57uh8
 GCWkHhiRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk30VGhrkzE6YfOzR7l5tW
 xJPnr3+V1+iWFc9dtzx9/et51/skT4oy/GT8+HZOVUWLybYvGa+5Tme+6Et9eufM0tpDvUn7xM1
 dG7kB
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Currently, K1 device trees specify PDMA peripheral requests as raw numbers.
Add a dt-bindings header naming those request lines and convert the current
user (the K1 SPI3 node) to the new K1_PDMA_* macros.

Patch 1 adds include/dt-bindings/dma/spacemit,k1-pdma.h with the
  K1_PDMA_* request-number macros.
Patch 2 updates the current pdma user (currently spi3) in k1.dtsi to
  use these request number macros.

This patchset is based on dt-for-next of spacemit linux tree. The
request number defined in Patch 1 comes from SpacemiT K1 User Manual
[1], Chapter 9.4.3 DMA Connectivity & Assignments.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com

BR,
Guodong Xu

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Guodong Xu (2):
      dt-bindings: dmaengine: Add SpacemiT K1 PDMA request numbers
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

 arch/riscv/boot/dts/spacemit/k1.dtsi       |  3 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h | 56 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

