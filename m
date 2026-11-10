Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339049;
	b=OyJgr9RmOmXnPWg0huaYISHStkDcgcr/VOWiOB3LKZU7JoOLLjT7lcdrpWmo+J4yy/xn
	 f/Ep423rEtimtP/4z4BLaapGua3H0tEBUj6r7TvpF0MzVQ5ft4uR5AD8HaYwJ3taF0DD/
	 Yx0oCie5cyfieSvwqtWKlTQ+2r2hoN8TLNjzisd6sPvfZI42CBTK03wAZ+YUlP/6iq3wS
	 XxctUw0GMY8m++kxN/APmcq+VVW0r2Qvomdnt+Eu5XB5Fw6Bv8f6d3M/JnPvXPVbbTg1U
	 Bfw396sWBEs6qVXPH3628KBMD5TrXEcxFHhT/5gloWYm//tVHW7sLXPRuIrKxZrrO6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
	b=ZDkDfz60Tq22qDY+7S+zbAl+wzi4MaIY7OzBhbzM6AEhFN3eNQzw8YWpks75jd/OvdLY
	 5OmeeqDplPyDHTXPyVAAm4ezrrOf9TGCuqFVyNrQGP4z7nh1OFzpuZUw4OxSUPu3NwZmI
	 38cVFJxuSXFivxlADv58fjUqsHyICNN1hQCvV5Yfp0BJn7xP1hk23BDOYSvRBdtkWZWmy
	 2lDnGjqAiiwTQSlhEnPBlRowe8z7R1PH5OrF5QIxORKdJBSiGW4nRhrrMzRltXxsRwkDo
	 7Zg4qzdWiDUrQHkW9EHCHoWFFjVpr6DGS2xpNBXN9gZOx+PeEhr3CqdchbiR5HbxJuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+rojFST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE9606A33C
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABE9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+rojFST
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso1756267d50.3
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 11:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339047; cv=none;
        d=google.com; s=arc-20260327;
        b=MTcxsRzYlzv6H+SeJ229HQ8c3lAEEAbAz4RY4lwQQyKJcgvA6k+3cF9EVOkIazNgk5
         WwiqniLkNYWl1Fjxfhp0fCASRk2YmSRzWKQ6JLvsPo5y9pv7MCqGrVfb2RIzkD366oKG
         nD0lYwEjvn0h+RqJukjQN8t0rg5XjxUn3/DB8sRoh47sYqXTHlwzrWk6C5/6oukSiDCB
         OYEetZaOq7Ara1YsjH+WdSpUeOk1y/F6unYXadfAyKwZRPcu9r+Dkzs3RskQlmk3ViJI
         2PCdzknge0+djB2uBLWm+fxpbrJyuexEkN9Pe7uXL/pHKyjb86k7SPDhR2Do5SDqW7YX
         ZhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        fh=iwDjuAaRo0ysgqQwnvSbg0zW8tNh+JPLrrXuG3WpdQg=;
        b=UmqlItJSprlBWQSbB6K4eSRAlV23DcnrjyyBKJfzbBrlCchE+8rAlMpY7xifrSJ9s4
         ZvHHSfBVgSrfRFi+SwyB9e7g9wAxR6rqvGBhlpuqWHpVLL64yrTiAIAd5EIb5e/TXbhm
         DMeeazR7S2a4ZV6URI7viVlS2wtM9I+Cq/p9gz7PyMU5yoDd5NIRrOstNGzoULGgBRne
         ibmHKHpoZbK9jNf1m/lir8/mF84lCyc4KFHmDMVmf6i3PD+jqxsjgFe24ShRZCuBTFZW
         uEKpxr7cjroHXdqxC41EeA1tMTgBGhBIEhdD/GgzVPl5PjfNFi9nvX71+5sldRIF6ZDf
         yXGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339047; x=1794943847; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=S+rojFSTLhi+BQqWTE+E7g4JBsustYFex7/5n2hKwBXDAoQlrWtKcxyVgpvAJDn+fD
         Pkxy8lEI/Ruha4985Gobwv2hGfLH9AVR1paUqk6s36K3AwLXtj2LDiMBajVIln5bAk4k
         qjWmPt3NyUGpVgSjRqTA2+fgqs8t7mqo1bX6x/WtT7lYCSiwEm2LLIdoO4VcMj343KZ1
         eqrX2a4Gr/bXfisnYbfJ5/vleBwnI8NYYloAVZVa6aLUOM2k6XV+p3Y5U6joPA89yue3
         yQvTxi3jhhGEysnYiBOVIgwqvVtWteKdm9wahaJ0QbCB/a6pHf4Y7ri5Qi9hyCHCiRUb
         657w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339047; x=1794943847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=ahbScntvwda3kXKcWrPZG+RAav9hGyGlXHv2slPodCi21uy9PusPlsff0W4WwGJHGs
         6zYaMIue47oschRofDS65GPxv46xYf7BvhvivpO48Bb2LV7cD/LNSufLSsd5IWQ9qEO4
         es185xR2FbV3cAZUSqtu1jPhFmPMtoEcaXUhdUvowYXa0eD6wkKl+eWFc4voOK07Of6w
         hnzSBhND1GPrOkQwyyns2YEBWtgt0RC8Q3Wj6NltL+Xj40LWhhv1rOKD40IUc6bKYcmm
         g5rrN06Ic8wPn8cYWgjYjpP9HcIPeC0oDWvmI+PaE5Py1UcYqgNTd/3eCsMXklRf9wzi
         fukQ==
X-Forwarded-Encrypted: i=1; AL+hErGyypj3nIvCVAiL/DjdhTRKUHP7IJRu/9x0o0lB4+zrzfdmRID4He6yW98LmP3vC0EGiOrwYImUEA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8oKpeaYZRiT/lgO/qWrCdVwO53Sgwe4oUZNo0qf6OBSnNFLFGw
	kPILIb1a1SHrt2hGmVMImVsaXdu6HagUKAPpnOpGDRrJqniom8fgxdtibWOHrPzHwDAowuUeKna
	L9Q9kDK0z31J/FODEgDghpGtBApPv2XY=
X-Gm-Gg: AYBFou1jwnXPFV29ldM25v5wQDhk5fIuyH+P9DKxlVk4H5iptZqlC6Nhi04sXNxwrA/
	VAhp+wde6inrytHSGV8XrlcZDfircknR/cEFOweJ6/fVBARWJ0Ry37qRIx+gzm0JvzZaDlRJGo2
	dxoal5ELryd4Tf/JnOjJFzMGmsdfaLYZEPh01khWN+bKMgXeBjd6mWeD47x/Q8akB/cstCX9jWP
	SykayXnx1ZoEA0ZSMW+XCKYjmSpBkzStPrNy/2S7lrGmDVqxKblTiDjenMFf5mlYyNzWkArtviT
	gtbKg8hD7LOe3D7v4joFYdyck8/UrKmmQbWlrmYSw8usTC7OVhIX7w5fZyAeoGLvRew/I/C9Mb6
	4h+cei/zZqAVyKfK7ZbCaDxGLcHN/qfnFUTywwg==
X-Received: by 2002:a05:690e:43c1:b0:67c:2804:fa9a with SMTP id
 956f58d0204a3-67c67fd7c9emr126041d50.36.1794339047361; Tue, 10 Nov 2026
 11:30:47 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:29:00 +0100
X-Gm-Features: AclHuK-V5XriYQc7jPlMOpsvH2O8V3xAiSzCm-87ylsSLg9H0W8yUGZ1h1oG_o8
Message-ID: <CABdCQ=N8afBsoZcTA7He3FOR9D2K-yieb9i4cAa=WksjoHm5aQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
To: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

A friendly ping on this RFC series. Any feedback or thoughts on this
approach would be greatly appreciated.
