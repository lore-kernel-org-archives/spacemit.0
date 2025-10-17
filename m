Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A32C11D7
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718048; cv=none; b=osREyz5J/GZ+J4Fe0K91oVSWKULj/WBBbG4+gdvtbaP301kUT4Ba/6hKPKKJH3leT/F5J68glQQoAkaEhrTp7wE5hRVmtC1Hg6Zma/NZ6zFgvq+TToMC8v/8QdQKXQcIHGKSMmW5YS8k6o+aRYCGKnhCIb3L4R9I34O42BRl+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718048; c=relaxed/simple;
	bh=V5+G6D9gYoHyycj/8QJCp/qEQ29MEhUI3xvN2kUgks8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+1Gm/pBLc24xi/IG301kPoCpCQhlsMWS5CToG8fwsUL8zST9fHAI04E9NPDg71F3g9sT4KAUhnT3ZGNGxrqTUA6d1Gj4hX0tPQIEE70swLIGg4OqzAIqA8E8aZW32vpZEiFrX5wh6FFZSztb49eV0PX918mk1QQgSu4I5HrroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o8BALkRv; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o8BALkRv"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-9298eba27c2so122845839f.3
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718045; x=1761322845; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrl9ZQZl0dfsXGeKo4b0s0yUNEi86+tLTNDIOrpaa44=;
        b=o8BALkRvh+AB44m+iTHiD7PMP8+0jn+vtlqzMJ2+V8zgYZc6cL+HGHOC3f/xQcyw27
         0NOLaLeq1lR+BluzH3Tjp/O2WJ3QIDLjLbIPDazBxrFaZprQk7rT6FXulpJjTgX8kNXn
         hk5F5jf3UaWwDvqZ7u4VeA3lUuwgqMFMSTi0fZkg6IG1yoAlaN5ARQ9/dPXT/kRQ0WFx
         f9RbkThHpz4Nwz/V+ckRlBF2iQshw8/lx07Yi6KYVbeoRNPo9PCgW6lVGt6XxoauKVdD
         HwxOrEGMb44Gi1hX1T1m/7d3RDmOKAQuTFhAh4SiunVyO4aDtrh1NIMNjhfSx3C0wScp
         InVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718045; x=1761322845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrl9ZQZl0dfsXGeKo4b0s0yUNEi86+tLTNDIOrpaa44=;
        b=v5qyX+XegVuUCfeEx9n+/A7fonx5Xl9YEsQZliv3wHF6dqZKE9niOjplz1pcnTiYtw
         rCVqdruC2sTdlv399F8SKHpOCK6PA1xOAhRntt+aUGJbKKUPQffnxIy6Em9gkM4fkf9m
         cU5qwEMgRTSFpmzV1dTU1Oj5GtX3KO9JAOS34XDw2T82bMfd0PuS6/UTCTP00RS+gye5
         B4EdZZY6foVqLFuf7G3BCRbQBEh0E98KTMRgzW5ffPkB7UiBF0yUDQlRdIhZ37ilhsdW
         pXE+uH1LSUll1vbckrTjJAccbnXjZ2xlju1TdCgRlOm30yeIinW84iUqxKwr63qrGNn/
         XkBA==
X-Forwarded-Encrypted: i=1; AJvYcCV7GTPZL/lYL/RRoEr5/EiML/dIuqWvQJXMc/bzQ4kwF5SWdMcrZUXr1CGeEbY6qtrP7Ir/xXozcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVMcPr6xFtsH69aXp8zCKbUm1teV9gmM7kc1WvxETHPK/Lc91u
	GHWbQxAJUIeqq3PGDSPk3/4AGuvFH4k6mtF+nE8jmmLVlabUb+Rv4Pt3oSY4e97ObyY=
X-Gm-Gg: ASbGncsBnplwO5QuRbEgsEs4Tumue8uDCpAHx/cBX+2koXKooRIwyXCN2tP76VGMxM+
	GeHf9Ud3gOaqngM2a2WfZ3cPV+n0T/8vrzPbBmTIG0BiiADAjllTg6iRuhfkNwS9IRlS+xflPQ7
	ssLiBpoNv1ZC6a894ydV787hsyCySjHkN+SF/KsO4mvkpwoLRygg2e8EydeVDPLehBJVAAFqiIn
	aho02eSgQQiThHHs7bWUuvjnNtIrJ89O13AdGJlvV+om6xpvhMv+uIXhkM7nFbf2pg+EyNr0zZx
	gWcppaLZ7D2voLL7NCy6aVp7Qf1gOdzdWz+Lv0HBKuJvAMr0HRhiZMiBZ2GdB7nTWX/ama7iFoz
	wpbTVHffH/GOwNQ3qABfASRdXt34M3KfFEJwgzULjg/q+fonRXdO7Tp14IIYXzGCG6mBtr/QnN4
	I3p4XHJnYq4FAGlIX8cdNyFSaUBN7lHGHBTEm6x2Y=
X-Google-Smtp-Source: AGHT+IF6pUvJ0SrEEfDoT+rWcs5Ssj/49Pi6P7PUBjepw0T+yRtjC6wHKw2821+rzZKRbVJoL68B5Q==
X-Received: by 2002:a05:6e02:19ce:b0:430:bee3:34a with SMTP id e9e14a558f8ab-430c52b5b09mr52484505ab.20.1760718045271;
        Fri, 17 Oct 2025 09:20:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97689basm12877173.49.2025.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Message-ID: <e7bbbc92-871e-4155-a1b4-96929199a1dd@riscstar.com>
Date: Fri, 17 Oct 2025 11:20:43 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guodong@riscstar.com, bhelgaas@google.com, christian.bruel@foss.st.com,
 krzk+dt@kernel.org, namcao@linutronix.de, aou@eecs.berkeley.edu,
 shradha.t@samsung.com, vkoul@kernel.org, linux-pci@vger.kernel.org,
 dlan@gentoo.org, pjw@kernel.org, linux-phy@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, p.zabel@pengutronix.de,
 linux-riscv@lists.infradead.org, mani@kernel.org, palmer@dabbelt.com,
 kishon@kernel.org, kwilczynski@kernel.org, linux-kernel@vger.kernel.org,
 inochiama@gmail.com, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 alex@ghiti.fr, krishna.chundru@oss.qualcomm.com, lpieralisi@kernel.org,
 conor+dt@kernel.org, thippeswamy.havalige@amd.com
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-3-elder@riscstar.com>
 <176054651498.4032617.11231316454316691309.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <176054651498.4032617.11231316454316691309.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 11:41 AM, Rob Herring (Arm) wrote:
> 
> On Mon, 13 Oct 2025 10:35:19 -0500, Alex Elder wrote:
>> Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
>> K1 SoC.  These PHYs are dependent on a separate combo PHY, which
>> determines at probe time the calibration values used by the PCIe-only
>> PHYs.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Added '>' to the description, and reworded it a bit
>>      - Added clocks and clock-names properties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.	-Alex
