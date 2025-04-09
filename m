Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006A11E501C
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226540; cv=none; b=GGcc/rKJm59hF8I+btM7Eag2SDu42JP0A1na3smp9R+tqb4p21sH+oBEqPUsgSWIuFrG6WiP8VetJRvbalsh69IWQLOj/lN2vOoI/yfD/77qWyleivM0hljLUqhfuomEp0beAsSvkPVNMZDMNSIyss0vB+rc4+Ls6/ddYEmCmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226540; c=relaxed/simple;
	bh=cmNctPgE5CTHw/tO9Zr51B/dhnA9zRrqJS02ywdELvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYWyvkbDt7pmBPFh0LUCB+TrUUlRKQm8rtVY3GZLJo5HoL3pPdGvA3cUq9Q3AP49Ma07Glzg0ZWt2bjgXQtC4lG0LjyeYsVHvGbeKrDnhIHetAMtLzlQGlKX45uv46/uUiayTEoRzKvpqAt4B0AnxHzK7KwFhXgBi3Sc1iO1uWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RJTHHgoT; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RJTHHgoT"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86117e5adb3so3062339f.2
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226538; x=1744831338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpmhxAFcMMXA3ewYDfoakLRc7cttBGIU/Z/F5aA9aBU=;
        b=RJTHHgoT8McomLkc5dSD8ipmyJp7UJfHwjGeOgr79YwWPgzf9tt77WikS6w7D6p7mb
         ZTDxkFwNG4MHYW4WkI5wq2WjTtETAfXT7aYxePNKClO7+maIH0KMCGH3H+Rvfe0avqTc
         S8gBFDc0kQs0l7sKl9pCgAOMMElLRv+jyNRjyVUE4RloJeB5+W/xxAGhpGhds0B3gOFL
         JkdxE9IfShfi9FatNKR+N0a0VdTA0koMcucoj4Lw1a+oQcClq42EMONwYgon0QyV2Z9u
         iI7yOlUPX1JWpTK5NeJqS6uhtH0IXMpJcdKh7lRpObjOyNnCwMCdjJbWqJvEwlOsf49u
         wfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226538; x=1744831338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpmhxAFcMMXA3ewYDfoakLRc7cttBGIU/Z/F5aA9aBU=;
        b=e73Wc66yXSSFIp8kS4ZymXFnHC++U8y7AJ3h/91H2d1z1D7hzS7+ay6VIK/gWtVBPh
         zg4Kr81zYwUtPhxps9BkrfNmWReFsAA3gRAxvbDrnoLIpEr78DvT1tph8pWh9k+pACsm
         IfHunI1JjlH4ke+mM5SJt3ln9B2Qmk8fKFMStdJ3RD5eiKessEBGv7REWJaoYlKf8xwN
         f8b/+IFBXZZDppI3LfoP+h1brzwDhV1WCuFH4XShHIJpdiuT39ZJwHji7YnJS6MQnj6U
         3vBrlaTg2ySJgOxH+5Lln2ajNw7UGPhw0TC/74OeAoc8SnXfYL4A3/WBEWaQyS1gGHP1
         lKOA==
X-Forwarded-Encrypted: i=1; AJvYcCW2sIxzm9/8gO3ftwI6kqpJtqBjGZ0mzBuib9S6x6ESSzqtiRE2WZU6XIX6k2DW7aEiHY3F3DKSMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi1wyFYC45J3XVMX2E/X4h4zNCcBSVpmTBgqdAieFLhZBYtD+H
	j8AftteOmDI1TPdgeCsn9pg0vnubOE9lfdZnzpbbjn8phhu24Q/2Y8ngiKYQ2tI=
X-Gm-Gg: ASbGnct/quiy353ZVcJEkPwqKBw9x1uKKiGyAXAw9aKdvoJhMQH7WFfBRlatEgR/Y89
	h5+sF+/SI7yUS/M+85HhSIyt0EM2LvoO2EK6bWC6kPrr3TJ7stKUP+2W19XXxbGLR/1JE4soDLa
	j7f5QgybHs0UCr8DCxSn+SXcPEMuqxC7y5A1l9JXcI5FfwS/jXvegiqnGo3DHh19G1QRIBt6Q3x
	sD2J4G/HpCrJ6xijph+ePgGIBLsM8mQ0gPdKSsA9ekkKDcnbXepufJufoR1FBvNP8S07CPtS2fu
	btl5nczQUoFfua7zN+5Byzyq2yvTrWLdJrgbS1TsuYXHdg9KhFaa+Q9CmNQ77XPNufRx8aaMJoH
	lh/h817DmHMcFxQ==
X-Google-Smtp-Source: AGHT+IHBIdM0sFVSXLsUHTwEjKCRbcHIGbDh+GVFxWpuuQ8TjUX92cXZCZ725TWzNK6m0iuJUoVS1w==
X-Received: by 2002:a05:6602:481a:b0:85b:45c4:571e with SMTP id ca18e2360f4ac-8616edbb21cmr9242139f.9.1744226538068;
        Wed, 09 Apr 2025 12:22:18 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:17 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] serial: 8250_of: support an optional bus clock
Date: Wed,  9 Apr 2025 14:22:10 -0500
Message-ID: <20250409192213.1130181-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART hardware requires a bus clock to be enabled in addition
to the primary function clock.

This series makes it possible to specify both clocks via DTS.  If a
bus clock is required, it and the primary clock are fetched by name.

Since the first version, the DT binding (which had errors) was updated
to properly define the number of clocks and clock names, dependent on
the compatible string as suggested by Rob Herring.

The logic that looks up the optional bus clock has also been changed, as
requested by Andy Shevchenko.  In addition, the bus clock pointer (which
was never used after it was enabled) is no longer stored in the
of_serial_info structure.

Here is the first version of this series:
  https://lore.kernel.org/lkml/20250408175146.979557-1-elder@riscstar.com/

					-Alex

Alex Elder (2):
  dt-bindings: serial: 8250: support an optional second clock
  serial: 8250_of: add support for an optional bus clock

 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_of.c             | 11 ++++++-
 2 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.45.2

