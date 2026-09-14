Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116B47A861
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399602; cv=none; b=HckZabzXjWmNtl6BlDGrQlpvuU5ge5Yi5OFmiq8GxQ/VDCfPush83VsloUCxORepadOoQ+5rlZHGlR/PxK4hbYogdSAq+pnaRX2JKc3Zcuya/VIDOdY++bGNLbIYairLBqvY5UN5392ly7onw1N+BY1Vfz4ymtZqlC/aS2Hccno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399602; c=relaxed/simple;
	bh=A+WJXH8LEWEmVEvHuluPt5ZSvK79HhNgL+/k4aL7GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJdR+4xyUq97KRXMKHgA5YqbMFX9GaLofJLCxf/Phkf9NIVQQmgX84p0xuaO8MceOAQ0bIvikMJzTandYAdB14JQ+WT1ZyCCpWcNthdax5+i4p2jHcEmChHeuEag2TWq7U7kV1M0K7rMt2VIsioBQVoAAyyIQ5Kzgw7YqEeDE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjtmZUry; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjtmZUry"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso21705075ad.0
        for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=PjtmZUryHVckmE0dMKc2tK7uRxLMlECowGz66nbqDn5vN6mAG3bsQHoLLl+sizToYJ
         jaD1HZgizTggY8b2QVb89rV4s8hz+N4ppDyJnigI6ASMFgmHy3jxJxfb2XaO//6dxaP4
         wMWLQ0XrCG8heQyjArbtwYKSHlHDwX+7fEGE9BHTdL4euhTWbn9R2NZ2QWeMzcS925ug
         6sSieb58zJKpr81r20stogn91fGyUtxDa2X4VzF4SyaJz3UeSIZzi+F72h00rOcxBdhU
         cThIqzRlyG5g7bv5JzBNbqv1Tf+JvYGIC+jMLlbyscVeaZRuDPfHMVvcja0uZ7Txw8B2
         GUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=ReC2EVG9MNrIEWDcX5S/7gbcNQTCZaxLa6eFKk0CzP7oFV8TLrEZ47rV0KdWiCvf+A
         DJm+G0stVIUQgqLKf0TPENT7m88Kwwbq2ZdcWwxmAOd08vCD6zZBzpFXyN5aSnlWynUr
         AaHj04oAOcH7n6fWlMpTLpUxYnQU0N9r2kuOCGlENXFk/cgr61uNKcJQZaFk37o/CkDL
         YsCIIQ2CnEzvc94eVA5xAR6TFv74VA0iw3Jc7u+huAOvbTOIlvFNpa2uDF59NxHGXvlI
         vUmUvMHv7K4v0T6G8hfwBGTJQ5J5JWi1fxV2LGqHNTA4ylWrFQmkUSINos8EWl+wVEjc
         tI0A==
X-Forwarded-Encrypted: i=1; AKwUvBwllCS8ioOC5krER8HCNm4wFsN94ugzJrGy0D6fx+saLgkvSwf03pzJBxOt5FOtFNq4h+e0WETgVw==@lists.linux.dev
X-Gm-Message-State: AFuF++kwY6hJnIfzwFpck4Kx9x/7v+E1/TTI6MkVIczP8HkmP7ZpGZUg
	D6tP+Nq/UVHAViVk00jy+nZHXCzcB+533X7FdxLwJ7VG5Y1gY0DskLnw
X-Gm-Gg: AYBFou1TPGfsUhX6NgfjDFzoJKtOmNwPTu9g/WtYfR0Mnp6ExrsT+bwvZULkvPXd08S
	LhZpReu0AlIAgtnTsHkG0osmyxxmo4EJD4aecPheE6IfLSDnOFj453nW8MePeN2j3dtfhLW5D4X
	IY3I/e2Y0uj/q5S/a0p3QTCsVN9/EVVuvZH1YIM0489QPWHdlhMjYmKttHn37vhZ18ItgDEwzdu
	va2wIwF2zry2UtviYXfCtDGd/5jZ3kLVbLU2VQ7tMNPg98yNAyIOYbtaZS4QjhOb1U+fZD7DvLq
	SPDT208tsfUFUSAJr+HQIJd0XQVaYXv6K/xUe40Ayo5hqItPiqTaIxqXq1MrMsP/LO1FYMUwhO5
	4+zY9vAgImKTQDMcUYAONJCSk/pGK6aoJR422B4s8tFoO+vRWJDQAZnWYhSDAMz0rCjgpS0GepF
	aoktzG2I9kwEMCTmGF0cqkPI5MTUXMgavHdWHUzBjC6DyXKCpbLCxpgS+YK4ZWexVfaatCKvUVw
	tN2MuVUDXsA
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
