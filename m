Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8282E4261
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034206; cv=none; b=a+2HHxVOc8AKwghtxl1QIVmlzi4bTdAruuuUzmGKWiiRVBDX8TAnEjTxF4B8oJMOecMxYxlXJTP/RbPk3QcZ/zqeBXCifaWStaWt9RGxkMgBBCaQI71Ze7oSA7f6vtfA7658GBjzEBJ9uibkSHrNbCceDYqmy7kkuuYO+3Ao25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034206; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlNPWKNkUKsxLWbH5kQDG/ieje7dQ3rgx992XmmDe2H5MPoEPsSslNkeKzlo0Ri1pSmpqQSpLK4JsdxOGZ2VDyzbFbddw7WRreEsNHSzQgejJgJeZrwPheZNxN6hsFOSYPK38KALuqW6EiaW4ge4C+W/RthVQ3MjZ1vkbNe9nYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=j7zVYSJE; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="j7zVYSJE"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5f720c717so333387185a.0
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034203; x=1751639003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=j7zVYSJEddfFmWcGHxLZ3K8FzTg12FNr9ZFyC4m4yn3sQULxiSFBCmThjYQD1PYIfD
         pUQmS5VmbsKk1gCD2wi1QAfe83nEMm4RFy88aqkHvicPbjiWoWI5uFsIGQlWV+6ataYY
         Iwhrmfqjl2Azc8EYRAKCXgbfPHvqzrICMccZHnrS+DAMo+oL41EI/vQxHgSFfqFxvNYp
         +IkMSDoFEfS+tn+5HgoeVBS2KaSeo7s/laPmZYAv/uO7H6sXD8MmAyAmkcLIzg8w9ZU2
         r+XFEKs1sdtCrLOGuHK/v0MjLPn3YmgwQB4kx9wb5mbJ7d1Y2OyTeKSuJAyvPQb4FTz5
         J+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034203; x=1751639003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=W24cwrVN4aiFTrk0bO4Hsd/iTWPDU2Kcl6KD6g5emYVMQoj/W4jWMXi+sv24DO1Wr9
         8TJDPToCoPgZzaCtLy7jSibXhWwD9aD8TiHMO1aosv1qANjF0oV1rHEE1IuYlCe6oOv0
         WZLlf3odoiWYnxwq9/kb5GJWdrsk8XzVqWvq45SD9US/U9v13RCczgs3NZLneyTAgG+v
         hz0Ik96WfI/ORvDlb/Vm4HvPtOXVWaNya48fG1TRNxm3oHHXwN4dVlhYQS3JttV+UCRj
         lYaLCoKeXu22hORVoeMpKm7+rynnDEXMhXAXG/BvoZZGpdOtqhU2tbu56zqRjYjSXh5w
         zc+A==
X-Forwarded-Encrypted: i=1; AJvYcCXzOFdmUbgzb2GLWcB8p5cpEmQkNjkhLMblX4/a4vO5eF7fxnKwHIl8RXJq5a+jgq0ekcCWYDl1zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1gFANtOF6Zi9BwWewZ/YywpcUL3ZEZOJtMEEXNKxHzhKGiayP
	3L2ZFmIJmizc3kqx2JsUJd+avTwMMW1NvxX1+var6udNZ+ldXioj6vxj/9zAfxKT7Ac=
X-Gm-Gg: ASbGncuvkP57RGdVOOLGlUDnYW88fYZBqwW9VSy5Ttgp5FWIyIPt+xufxjnE8/n0WCb
	szBQqHMePtHQIlU+tssVmlGeU4o9Gbt7f43Hb2dNcxd0UhW667hcoD7SfkIE7kp1+dE6/8XV71d
	cK+vAVLmd0QtYonxOaC9ZCahzUuxzDeBDwXS7jhypIcIK0Q61QiOXs1IQZA6RyuSI9GeMekpiXO
	alLHywPXLtCR/9/xvW9urgrIaUbjXAzNpSsi9nwK5/C8DBu0zCIfsMPIeP/WjIq2WL/bAEuqdke
	LjDOejzncy6qWa2vXOxVdqOAOLNlXCx9aCpcwlTHhb/teYATS6swddf9YS4l6NeGwKqbtzOrQUO
	OMhctseV7UTZ2b8BH0Eq4C1hJrP8vwM9x/wQ=
X-Google-Smtp-Source: AGHT+IE88bXOLiCjUu2+zVcecKfJf8g4CQ5BFAJMyhK2OHk7mseb/EKQgLzh833iCYXdtJd2+G7LJg==
X-Received: by 2002:a05:620a:2729:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d43bc15837mr1028658485a.24.1751034202759;
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] riscv: dts: spacemit: define fixed regulators
Date: Fri, 27 Jun 2025 09:23:06 -0500
Message-ID: <20250627142309.1444135-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

