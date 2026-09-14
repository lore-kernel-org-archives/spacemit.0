Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46F4A2E24
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399628; cv=none; b=djy+ZRP2ChQUPqsyAuhhLdoMRP/s+c3S5sx++ScKC9xMlCNlGhe8c0rfp5IG2PBUbNBcIVG358HWesVjtlsrhO6g0J+VpaC5BufPTA21lKeYzclULQ/KbmQQtIB0IVC2sVF9NkwcKiInNMr0uPV7JzIvbI/ypI4xKWduTyVY3uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399628; c=relaxed/simple;
	bh=VzeJEVXSydd4pMUvk9yqOjcNxVq4nwrj6o3Y3f+o2kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToRU8xH1JF6ucPB9jh4r3294/5obfyZuJaTk0iC2eky0aqrXzimLPqTwd+hiO/Qp8402Um8cuHEgzO/DyCLFuDT+7alVOcuHNgWYm8YdpblYFCliXAICNMQH+46pdbkhvdH39ld6OYcCDyM9S3AxKKJhKAG10GT5XIJ+vFjBF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvBQgiuy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvBQgiuy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79fbso12859465ad.3
        for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399626; x=1790004426; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=UvBQgiuy5mo2JPNG4jjIYncsQxmbF1THnAJtSlqWfyKtoXBHT5wXDyhD5KTIzIOmT7
         p0B9MTJsjSjkHOk2SExszkwBfKHG+ytWt1TuDelRbpwjNoOwnPia/LrJXZbDJw8qBgD7
         YdElkc/wd6gFvScQ6eFQSuh2m+edT6hReblbZNqPiyx5DxuD9RtEXbsbiq8bWFvDCg8A
         PxNN3CD9TLQd3oLCE23qjO22J/ACA+zJfANVKqTgGh5gr8Tujqt1PhStLk8iu2IKsKhI
         dkLe2X/wbIi/RKeIu8NMGc2w9PKouexFhfFwPXkuYHwdQ8tYd8mp3EPoqelTKzlSoKYn
         hIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399626; x=1790004426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=VsiYQXd7fuUa9+Uw2yVMKbrpHzfj6CmN2csRTP5mu06oZ4P4tac25U7Ar/FEF5tQ2A
         mEs4t51kcuLuRBV9v+B09am/jcpmlYc/n2lIEEBHbPcV7RNE23G1XMVL29VYjcSqnfL8
         3VhXANWkbpfnsYk/WxBdeIBs8/5/EngM+l5XH3uFPdBYLG6Hi5XIRI5rqvK3uHF1yTtZ
         icQ07AvkXoAGjr2wNZWK8WqjDk8ldmMhfuEUP87ROtsMoXjPfGrto24NTYuzqixyL6dW
         VyvJKd2MuM1meopOvJYE5fewksDGGC6VnJGldRTO095gOb6M8/d8q3lPp2KDcWLmuQlw
         s7SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTtrst2dDcBqPwz3GmXePkM8s3sw3YrWeHjPP09Qp8ovlhGqvpxeN5t2I3fJmPXiS9DEUIBcPKSw==@lists.linux.dev
X-Gm-Message-State: AFuF++lgWWHalgTwqrjLjDUX0ZvoNkmYL5EWoUNNFFRLXXOXwbLrQXWB
	q5F5DqF60kYlW4JIoAr4L4w8dG/x2HwEW5UeuaebLyHM8s7j7cwa0gi7
X-Gm-Gg: AYBFou1AXzQ4NTb9DKbM/OVsbl+BCLAc0qzysNSXR6h+RMHGKJuLLgb/t1XGgoQAT7b
	Qlt0BAqdWCfBWNlvnU0FfbwEim22cfZ0qSRqRS8Vz1etsLPhcStMsaoRy3aUoIBb4NWedIt3JIo
	OW+1l8g9P+3RCB6NHFvrMJMUNCX00VP+DEldqVrc3GjVtgeGZJ4tyQX5LUcGdkDrT6Jyp0lZwT3
	eSeRk+1b8WdLjrLLTcViMm6ddE2qLa0lDLEsCJo/oipSYNfG0HIFrUvs5f4JExrU2kQkN0gYgyD
	cAeSn40o/b967bOQTNvRbNWYbxR4EUpXYexhF4+0hveIVmHHnVGkEKzpgT8IYlg3u+RjUp38H8m
	T6rhkZHIKaJ9x/m+x/zYSbSaZCsO7RhQkQuKRTKkbB/f6kzGxh7XDss1IiZooiHpMvkz6wi13tK
	dlBv1dUIe04FJltqY+VnELnc0eJtUVsw2p4syfk9my611q3muRcWGgQwqqHOF/Z9D9B7/jsDlXk
	AxyZS05qncV
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr77776255ad.16.1789399625921;
        Mon, 14 Sep 2026 08:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm51774945ad.54.2026.09.14.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:03 -0700
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
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <f9a4679b-52f3-45ea-b451-26c27dbebf1e@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:54PM +0800, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
