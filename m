Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E434B42B
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070768; cv=none; b=UKf7IY9d827n7gtMSko0rHEoaCQsNwGVnCmMwsuFuVkURe0CHEFXs0d41XkBS8mjtd0S8rtbQxzZvG49NrCSiM7K/rnHElFy90GdfpTloX8j5337jK1Y3rIPWNmsSnBOGyIQxLcfcDLLi4uf1yRJEhLNIgJH3pRFTXztWepP+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070768; c=relaxed/simple;
	bh=rpoPtr0vcuPSzME+OCHzsK/d0X2Myz27uF4+n3Cpbv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHettCsX1jDjw4OcYrmr3VmsaotMlGmQel8RLMXDwzQVvFCZHbEd/1YOcqBxjT8j7CbwTWCXqF0i9XchRQjilv+f7/fRSwIw0iyC7LpsP7kvMsKFQIVrHwf+KpC/FDoCzNyP6Ai8b7hapcIsj8PHrCBPYAKOm2nSwvk3d2gacg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=D0+EbJ89; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="D0+EbJ89"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-889a865bc1dso5976966d6.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 07:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070766; x=1766675566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=D0+EbJ890bmGbbs2BpPu1Sm8fKfVNbdg9N3jgrHDY3I46PmGarulcOqf4YRjP0Ocrm
         A74kgfHFJC5sX2FsqJ2Yu1czTN0/rLijR1E2m+JrLlUNuIj4m9cn/n1euQ9ey9YPhjPv
         oSH459KjRUCsm4fWNVsa+im+tyifhBRyCWfc+7ReMK7YyuZDXHVtovAI3G9qH3hdAxr5
         LMJshkLtZZfwaVuZfkk7TyaFF3gYyozEJuaEYsTc2kSOJV4Ce00EHARCbo6QErWhdgjr
         6m80y6YgK2Qq1Gn97IpHcuCI78ksfH0Yz5RN1nvGFdF85x9j5l+M8AY8aSrAtCmuDsjo
         eFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070766; x=1766675566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=FLO7vASad2pMw3xuzKuits6mG5bJJOoFgRabTmEBXc0Qao885UHufusgzZ5hijwkut
         nFzk8glxdXUSxqnUmvepuCntNTfIjBfY4BIlUW7bNH8WVIIizb0GZrW0sEygV3u05SDG
         lI3W+wPE5Tn3Dq4B3AUW73L4vbMi3tBzuzo6Rq2b+6fsw1k9Dy4Wr9qGIR5Jot/ZoUwg
         96X8NEZJsqmLo15jiheNi08Qquwz1sIYZpWNLuFRjNwFdbAadbdG/TJfDe/rLjWb10Y9
         ny/iVDE0pzhkMaL+AsF0Amd10cB5lNkRAoc+Hhh25+QFi670SyjrvLwMuy+EBdJufwhB
         05tg==
X-Forwarded-Encrypted: i=1; AJvYcCUzRYhTn3zxNQEVavIvXC1qQs0goAAhEVKj5vMqZiet9qDvXbiEdnOC5ONHB9SHyOBB+ZrBteCt2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNNwTuSoOT7ZtGewZ6i13IeFK5u8beV1C0FrvwGqyHe/QKe8eZ
	QaaQl78GrcB8b691MBKKFDN+Y2DIf76haCDhJsZIwVHYUBJcYNIikLYm56I+9c/E6HM=
X-Gm-Gg: AY/fxX4ou7NnMlxd0iwyduQtkPQqezZD7DC5U6hnFqk63l9XN+kMco3b4jQnE66lPd9
	cLZ58Ow6/7vW60heMnY4J7i0Jsnhz2ch32TZ4RlGHCg6AZ4IsofoM3ePbTcpCllNvMA3bByLcR4
	biXPApoxBbawgLI9JY/R8HtXQPqH/EuKPp3KmsfgV5WacKjddMkmWb9n/ItkPwanr0Oa7s/akAT
	DirqGZnpwgGUdwfG16gx99Zx3TKXrlvOujcCHr7OZYiRvjdMpNlTiUaIJXPh/KWKqcvWm4a/sRd
	JGbpsFDm8xxqXfugtB4MNpSDjBTH76QqdigDdcWYk4LdJ/FPHNa5HnZ4rRf1xoQx6mitazKfh4r
	un8/lzE/qPn8lzivPOcy9TnibHoW45GgHV3u+ospIiuYn3IF0uKlOyon1hjDoz/Ukmab25K4HNF
	4Xu/sdb+vurii9p2mdZjJDoHzPpElk737bsRlkrP6hFHBqtcyh/j+KWvKvBBGlo2P+
X-Google-Smtp-Source: AGHT+IERRhvykRpFylfwji2IOQvYUcPVAffeIot0RaCQgPjegE4XUR5NaxLoYPi/HSBk+K0ZcroidQ==
X-Received: by 2002:a05:6214:14ae:b0:888:7c7e:fce1 with SMTP id 6a1803df08f44-8887e1e9bd8mr237057126d6.4.1766070765721;
        Thu, 18 Dec 2025 07:12:45 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:45 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/5] riscv: dts: spacemit: Add a PCIe regulator
Date: Thu, 18 Dec 2025 09:12:30 -0600
Message-ID: <20251218151235.454997-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318e..71f48454ba47c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1

