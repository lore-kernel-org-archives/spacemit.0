Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4BB2F49F0
	for <spacemit@lists.linux.dev>; Sat,  6 Dec 2025 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028744; cv=none; b=gtViAHw65XzhFGsO/uQyONLp2517GVWtUtdLv0dNb4p+m8pH6qzVs6yL9Ml7Vb4LLsF1OzRvHrA/0oQPJClzqRLJs4nkpb7P4lXr2K6q/G5/keDBmAtbeCbRFvAG0hFRc7p4rKhlXiTh8qu8PPvSrPub1of82Lb5Rf+bAXD+e3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028744; c=relaxed/simple;
	bh=Ixfrv34AWUu9/W2tpUofqbMTjZBj1HVmvhbEeYoVzaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=KcAgRnH4T/DETwFksMl/mT2j2FNh2wJWBT/ykM6sJObWZCrv6iQHMG/GEF9RHYAglNzx5y/C6O229S2/+vL04EHLfFSkiY77JmfjOlRRyuV3TMrj3MnN1YtuLLGm5N0kzGmRaN+nl2GKi/ft5IIIKspu+BJWPksfBDZpKGDHn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0nkH9Vq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0nkH9Vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9piyTpQ6TT5OHkiv6/B5x9F9Sfk8WGsncGds5Tl6KD8=;
	b=f0nkH9VqN05V6Ia5IUmiuWK8h9bZsX9p0P1rjPItq8uMzMPVmMc0SXj+qneCuBeQYiDiZB
	L5Cg+7DRplmx38/fCP5aXr/1VegjJHwHd6dLC5Qkeg80bGF6THTJ7MMGcyYoEMTMbw2eAk
	HfX80qcVmanaw5GkxsjTHRWYAr0RkeU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-aOrRpwb3MlGceWjzvE2jKw-1; Sat, 06 Dec 2025 08:45:40 -0500
X-MC-Unique: aOrRpwb3MlGceWjzvE2jKw-1
X-Mimecast-MFC-AGG-ID: aOrRpwb3MlGceWjzvE2jKw_1765028739
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4788112ec09so16912535e9.3
        for <spacemit@lists.linux.dev>; Sat, 06 Dec 2025 05:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028739; x=1765633539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9piyTpQ6TT5OHkiv6/B5x9F9Sfk8WGsncGds5Tl6KD8=;
        b=oDKAovSlJRKRQRXhISoVQuHwAH1Nq8pP97up7pIN8ezluu/o9cecMcSu6DuJRWpNop
         d6awC9VGmDybfCsaQI7t60YjfMBkm4q2Fw7UjOUNRQtKaJQFRdxXF/LYotHXcKBViauL
         7g+bQUCXX5AVTa7XDAWaTS5iBP1/DAO2ATV8Yj3HOcmQFE5tJ5rgNfll3rO75uj6ObDy
         IshgMplAfOlYpU74bKQiQ+O8cklJTC2QRp/FtZvCuCVdr8XF8YV/TD0Jz05/TDRq/YJk
         45uNU8nIyaoxFlStjwTuYI4Vh78qVlOE3ZD7hu3SE9+mNlu7wIyQabvXwpalul4esEIN
         lUGw==
X-Forwarded-Encrypted: i=1; AJvYcCWlo5xQTUOZcTD0STbJ2nYwLWdVtqqodgYbpUZWci2FwXDt6QBnhj/Mk74ThLoDPQUdSEuUOUQcCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/jddqey3VaJy6UfHSAwjlKONBCdL/2fKIRn8noEU/5RZLvNkb
	E02tvBqaV0S+xAPJUeFxOcV/SJfBSApJgpOKDdl3gCbk79RNPcQYgG10mywvXDFvXqbqJPupROd
	rjqL73uL8r9tje24Ct+ZkY88WpNkXH4obCLT4JHSBgzLGyM0/+/Z9D7h4ZUSU
X-Gm-Gg: ASbGncuU23llW46sK6+G0Vh9RDGYC3cMcSokdFc0F29Fe0UOfNE6QSoXvvujGceqO9Q
	4JoQAGGmBkTeZXEPHnvUH+gFftFzESykESVujQwarOgrImH+Bpjkv1mheGEGsKwKLI9hNh8VHpc
	WOlUFBI/+4DPpQqeNXbt3m/aL9uZHoHltIazvWwVu0o/1ZZJ1oOCu6l/pWWf2wS7WC0PDDF7PUQ
	MF8UNlLhlsRbvJbGrcpsNaH1NGxziqyypLSt/JFCn1JBSGvGroY2i2UqYVSDRe6bwRI7kVWRVRO
	oeQ9C13mwXFTnUJYMh/aexqjP99RJi2UOilrORAUHa7kPVn4SBS664uwSd9B1TM0iTyYvnLTAMr
	WQKLRHpkasoxt4XQjk8K85VD/YldYRr4Qgi4=
X-Received: by 2002:a05:600c:524a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47939dfb06cmr22732345e9.8.1765028738883;
        Sat, 06 Dec 2025 05:45:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRf68G+11uMBoOmMOztce9Dtg+7RUcAPRCNepMNXIDMmbVwb5H+ngp0wvK48xMgJehotiAqQ==
X-Received: by 2002:a05:600c:524a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47939dfb06cmr22732135e9.8.1765028738491;
        Sat, 06 Dec 2025 05:45:38 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d330b20sm14457955f8f.29.2025.12.06.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/3] riscv: dts: spacemit: Add PMIC and regulators constraints for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:52 +0100
Message-ID: <20251206134532.1741648-1-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: umL5TAwgR4gCHViEbE4Fyrwldrl4ce6ys2CH9i7qI80_1765028739
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hello,

This patch series enables the i2c8 adapter, the PMIC, and voltage regulators
for the Milk-V Jupiter board.

The power management hardware design on the Milk-V Jupiter is identical to the
Banana Pi BPI-F3, so the DT Nodes were copied from the k1-bananapi-f3.dts file.

I have verified the I2C address and regulator constraints against the vendor's
downstream DTS to ensure accuracy. I have also dumped the regulator_summary
debugfs entry to check that the regulators and constraints are registered:

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 dc_in_12v                        2    1      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc_4v                        7   10      0 unknown  4000mV     0mA  4000mV  4000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3425mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3425mV
       buck3                      1    0      0 unknown  1800mV     0mA   500mV  1800mV
       buck4                      1    0      0 unknown  3300mV     0mA   500mV  3300mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3425mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3125mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3125mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3425mV
       aldo1                      0    0      0 unknown  1800mV     0mA   500mV  3125mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3125mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3125mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3125mV

Best regards,
Javier


Javier Martinez Canillas (3):
  riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
  riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
  riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

-- 
2.52.0

base-commit: bb3a1f127972ea262f98eee55068de1e54ab8d57
branch: milkv-jupiter-pmic

