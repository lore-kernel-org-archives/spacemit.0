Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3725232785
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749768994; cv=none; b=uq1oAKQOyqJpe0K/4IyX/zKaNcJInVAkUZBMkTVooOoUjY+b2JA6rkyD4WBpG3q9H3UKsfmeXt8ZJnY9D7E03/IESiJDjvs3pCDTvvSSkatTxWfweTbgOYrNuPueP9dbq4qC8h1tvUlVtfER1EdA8DVYdEpbP8GhwsyDABL2wOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749768994; c=relaxed/simple;
	bh=rzO2vUG3qFvZz9nVJkEDXegLFrtHvbT/BioXWBPlI5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRTLpDLKKXHEu7CCev8zajJRql2vfVBhZijxjhq/zGZZQFP10YsuHJ50/tZ2Vrz+on5yyudbXgwnpD2RFMZffOK1Af6e2l2GZrEci8LRXH/4gAtwt+Ds9unLffM0zCxA29qAI5DYoUcsx+nqp1WoVRhVEkePQM1PwWWNgA0PeRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GE0j1M5u; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GE0j1M5u"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso11671935ab.2
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768991; x=1750373791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=GE0j1M5uxDF2MVkaJWOpgjMzZtfFiEXf8rSUtWcENBLW0BfPOxq+aCCrMjn882crYg
         J9ZKehAemf7R1meWDuU+e/o7wRnVG3Z4FBBLNW+S/SK8qO1OwKTXJOVkfO1qkTu/ofJK
         oTMNMcJHqFc9BoaImU3Y6hlPrSpY31BHAzDUN3O8zwh/LLmasp3AGtRkaANSu/Rohh4b
         rhRDf9ij2OFvApmzqZzZbm2uvg2QZy+etiuKDRJ2WnQDICrW4QMljB8DFPfDzRdBKxux
         1UHUSs2NQMX+sQMS/1RqcgwsZ+Llgzu/ol/+FbFYGTas1ju1O+JF/EDGO0s0C1qox+hS
         lNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768991; x=1750373791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=Of6hcqc0a5xF+cai9FBin+wL2kOb1Uvhn12CtPuI4H3OZMN9lX2DuK9sTaL80Tzq7V
         2fD9kdkpnO88ppBVcvelu12cQjFS6EE6wNQg5dwOlu/Wh2912Dz11PUT8aubFAdBjNIk
         i+GVESE2YUETt/l4Hmf/iMrslbfSksWChM3weTsV+UBBklwGnmOfYP4lNr6Vxry2Ycz0
         D/fE50Ca+E0RSfs4dfKq4msUwh0kQ3DGbtJsMPc58YjLDl9PWz9uK09RoRguNorjcRIq
         +eihhW+k5JpLWCoOqonHcfxyru2G72SgII3C+DECF8URCocvLM6WtCqMtGul+NN5xwKq
         DElg==
X-Forwarded-Encrypted: i=1; AJvYcCVLl0OAhIJHr03cKouHrzHoGCKF/WKH/axl9Tx0uqvXGXw7cTgZcEdus3YqP6M31PLgBZwxsglvnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDlIL0T56DWKOuMYWtwvCf5xakUdPyhysMdqHzOP/yfKGkjeAz
	9OQVHdprJyHlZeLYtGnBEgiwQ4oWH8KghMph2sBxKj8a4MQqLxrIw0VYh2NsY765qnM=
X-Gm-Gg: ASbGncvPQNhMIwd0KtrNdd9ouOmazstmGaKKa0eV5yWYApQDJAyQrv+NIGO/wAGSruG
	tJr83k/14AuC0L4DnKpmEpWpe9t2up0QfELp4btSEFe0/K7r5QdO+y+Br9u/fU35k4KwTezw+II
	oDGvC5COeqASNlHOSySLMGJTMyWuNgJDFLz9eUAmO39Rm5hnFvuwNHSmxjk0ogncS+n91/m5zh3
	5la55obeKSgfrGruWGTrBjOgIYx77d6hz7aoHuGeO/Nlax5rrrEavkSE7hBgq9QfOtmz6llGuih
	g50jWR2gQmz/y16Tveo/CGwOcvjrxrSLOltQIhU2YHWrf/EZgKeOFDazmS4hJJSaI1TPE9lI7K9
	qO7L4VpuYfORmi2bEgtHQSPjE/wI1SrXDALDZpxeG7A==
X-Google-Smtp-Source: AGHT+IFl/qtFDEOg7fq5AKLUPKjkJzQ1QBSvDDw3zCkODT+b5Ce6LNmP5J2eqcw2VDryqjSPHaqh3g==
X-Received: by 2002:a05:6e02:184a:b0:3dd:d6c0:cccd with SMTP id e9e14a558f8ab-3de00bd309amr7524375ab.13.1749768990866;
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d0c4bsm209125ab.28.2025.06.12.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 12 Jun 2025 17:56:25 -0500
Message-ID: <20250612225627.1106735-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v2: Added Troy's Reviewed-by

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

