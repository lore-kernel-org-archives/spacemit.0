Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C61280CE6
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403917; cv=none; b=lb9xjWWmzGp9nhKueUZr7VYsSTureKMbv5lZ+9ZoHU1tRmpD8GMpD5Ylh+OvMJvYnlR7Ybt/w3ognG9DdGINSf8FofqpP37W1SHWVB7PgdFbMBE7/TaJAnmcN5lAW0dqAliwuD3vP4AvhkCwQd9tp/EmTwmGH6QVCUvJk48Ebqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403917; c=relaxed/simple;
	bh=jP2gH2HxizlXVnfCoefiIXX50CVQy/awrI7TNYRAzsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRs4uYoISdiQYrxR/mRAx1HgVucZC6eWgP7qyGJT+taQ5QVqCDFrcG+IPKUsE/GxUeJxbn3OMfc5zRcz9/tZFrLNEUfjZbyzrORKxhDvdR7JFztLv3Ry0UvETFULjTA4ykCo3zkPQhwBDs+qabHAtNKwbrk6VHcPVJs8B13CpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ShsrLyFm; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ShsrLyFm"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8616987c261so76427939f.3
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403913; x=1745008713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2ZInTEwsl47QZUkjk8fk2tvbcX5FPggXx8vW7X4elk=;
        b=ShsrLyFmp2onBoe7fW33pESzxXoY2njkEttbatUMHZ76BzwM39pDh2G6DYYx+QdQkX
         75YrNM4Nn5AkpDQQdeZuxVZ/utFSwdDjZPyKcUBSKwQ7Fedh+fHJz9+OsoCT0Zy4ib7R
         fP4AYzq2lAt1EzOnrAbCzsImPyu1qcsvlOPk+WK6A0ATggcqZPkBiwVnySyUcVdmbrgP
         JRFtomUxRtykohPYpuQVYOXlgrvW1CQkZTQ0StUfpF0oS19hlsqDrKYIUIrnfP7w6Qdv
         rtnawGMwD6pPzH2a/ymbotDlyX934YMlC0BGL9T0NCLBcv8LRFNYlYZiW2E56cHBCbIy
         CNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403913; x=1745008713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2ZInTEwsl47QZUkjk8fk2tvbcX5FPggXx8vW7X4elk=;
        b=Z6PJILk/d02z8AvWz3cGhj2pjcNsa3/lfVLGy//0Kl9PfUScHdGt4jn3CCNY9Fj3Z5
         EiiU7KV3oKV8LOf5OdMEc+oR5YydVlW96yS/Th8qkp+QnomYaFviY0dGdSbltmsp45Yy
         5u+xlqXn8BFUC8+Dc3ZnteNH2Qg3sdB2fxSVVQGft+St8iC1ypqB+G4N8Pim+T6sS8Ec
         QXZOsjQQOBUqHXILlI5TcOZhcZHXGBtCn04XTLAeDX+PYP7qbqvjugjRS3Dxxfu1GtzJ
         /J/jiJ0/gViBFmrpFi0gVPx1j5pE2rtj1po8P/Rd63vrxra3Tj0edbhYUq8N0u0pa6+M
         MBQg==
X-Forwarded-Encrypted: i=1; AJvYcCVjCCfLKvxyjdeU0PBoIJARzcfowBeCzm8NYMP7P5ZWPfy1xQt6EStpQAx8tqKvOE5aDprLePnnfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGDO415u/UcS8Bm4paXMsY9vm1vl0HNqF1puvPdfJn6VtkvoFw
	5yr30qXMT09BwQAZMtoB23sNtWyXeWVoBimPMtO6XEU6bs8wWVs2Ua9a5om+K5Q=
X-Gm-Gg: ASbGnctRYk68rW8THyMkh8pVGxUPMTrCOyUbAgt8NlmYnbc1nW44tYcU9/0/fCGhXv8
	RpjKQe/Vw8kEXNMbHJ6YlmDKClp6lrwKHRnvlt9f3LbuXUxWIIhlcXJSJtOhrvXeNB4olJANdp1
	IcBbaF9x06XsgW5RMf9CpNTkTR+IHEn2y8j/Cc8wP0sRSGbUQM+0pgadUSDhjgRT/oHc6fgVkIv
	YBpG4Snv3HA2nrye4lkwySY0eTRu0r0vHlXXAJt+e7BfbTieROMXdgN8dsczQK3gizicemqJLYv
	Vr+HPb/Qdbte0XOcQyFDKiZsXzmoYXSLpFXNadfJG+GK9KPvI4jkop+A9ygK5brb8NOZU9tI/wd
	v8juZmNAsXmSNtbJ9MIcTwvnW
X-Google-Smtp-Source: AGHT+IF64rFuEmhScHDoMsL9QXFX4Agysz2oW5sGUVVn3Q82xJQ20AI5xuTlCrtn92K/dBEu6SxbnQ==
X-Received: by 2002:a92:c267:0:b0:3d6:cb9b:cbe9 with SMTP id e9e14a558f8ab-3d7ec1caab5mr44116655ab.5.1744403913131;
        Fri, 11 Apr 2025 13:38:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andy.shevchenko@gmail.com,
	dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] serial: 8250_of: support an optional bus clock
Date: Fri, 11 Apr 2025 15:38:24 -0500
Message-ID: <20250411203828.1491595-1-elder@riscstar.com>
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

This code is available here:
  https://github.com/riscstar/linux/tree/outgoing/serial-v4

Changes between v3 and v4:
  - I simplified the third patch by reusing the local variable, as
    suggested by Andy Shevchenko
  - The first two patches are identical to what was in v3

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20250411154419.1379529-1-elder@riscstar.com/

Changes between v2 and v3:
  - A third patch was added to disable the bus clock on suspend and
    enable it again on resume, as requested by Yixun Lan
  - Rob's Reviewed-by tag has been added to patch 1
  - The first two patches are otherwise identical to what was in v2

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250409192213.1130181-1-elder@riscstar.com/

Changes between v1 and v2:
  - The DT binding was fixed to properly define the number of clocks and
    clock names based on the compatible string, as suggested by Rob Herring
  - Logic to look up the optional bus clock was changed as requested
    by Andy Shevchenko
  - The bus clock pointer (which was never used after it was enabled)
    was renmoved from the of_serial_info structure

Here is the first version of this series:
  https://lore.kernel.org/lkml/20250408175146.979557-1-elder@riscstar.com/

					-Alex

Alex Elder (3):
  dt-bindings: serial: 8250: support an optional second clock
  serial: 8250_of: add support for an optional bus clock
  serial: 8250_of: manage bus clock in suspend/resume

 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_of.c             | 15 +++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.45.2

