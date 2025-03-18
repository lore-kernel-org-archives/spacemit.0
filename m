Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090801DD0C7
	for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299463; cv=none; b=OjwLaH/uP94XE8k1QB2jpx8n9uZZLS4JISir9o/hTDM2jhUV7lmXWLDhg4MByNNVzqcPEJJy7yIqDfMhgOaao1ybW7h9vETJcAjqKKGKTnzxGGUv8R9xvEL+T8BiF6sVeRK++49JeDKssYkIA30PPb7Qn4ovObUnwVeBZFCYy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299463; c=relaxed/simple;
	bh=Q4mZtFR/Tt7/i4AsUspqof7CvawdukYJTvPRyJptRhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxVfP5J6OsWcjfEOCf2LoDtw7f1epucxawwKlctL51/N34QK3kW+MoNsIezO4ohdj7OV2FiRiZ//PHrL+lgf0FV5kBqDL478KN1wgcOz6PMJxnB5uH89/uRwqkkWmcMfrbfvyeVrURYbd78RDBt9CSXgybsdeXULKE8S+zXxWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=D9uOQXgJ; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="D9uOQXgJ"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d445a722b9so30224545ab.3
        for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742299461; x=1742904261; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CJnOafkcvrR/l5VXbCtNpeHL6EGqqxqILSUHXldXfI=;
        b=D9uOQXgJdquFrjtVGY078zWkfxgKVQ9MT5KltmtZHVAA8cNmtdplj2Xe4KjCpir7wx
         x6qLXABy12V7KIdpYpmekQWnZcpHDwSUZ6zfFlHrYxn8OvYBKc5B+XVYt1jhwKsAf4eU
         zHBeJ/9VWqI8YZ+PpWt9ZQpa1PJ4xeTKql3lKRxOUCXdOXyuanYgBGkEL4/pyjtXyOps
         gFAK6Q2wCpfevP/XZ333TMI4qTmcG6uOWghipjrgqSgj+XACd9yOfDe37V2dnSmrII3w
         ASH8RWOLyWAIAWHGWfFktva0U00RKMIQ7i0DUe6tfb+Bt6VPmqCSU8eRppaL3DoFaKRb
         XMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299461; x=1742904261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CJnOafkcvrR/l5VXbCtNpeHL6EGqqxqILSUHXldXfI=;
        b=YzzEk31SEsxfe8Of9bSjccOqXHEioXuC+PcfGkQchITo5+PVYphbiyS3x6bJaawi7g
         qhdSG6tIubougvP86NOzQOhC5TlIQq4E0Z0wvjhYjDluaysS7M+yC1qTC7idsGYaUObt
         OEchNtA1mlDmfN6lHaIFg81o4L1q93xLjPKyRV5BjDZ74/Q1OllTJhOKQUOlRxO7cxwN
         kr8TxPoKYV7veP6qYDrA1kidOr7FLC4I+9I6G0g/0BjOJKDe7pse4fhI1Tymph5pRPRf
         Ro89qWnjI0KFXLuz9097GNXPw2BqADncOciZmMUlI3A9VIrtcxnivkYIh/Qv8dpirDVi
         ubzg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxPN4D134eaG+RsgFJybKQnsdOKZzpynPmWf1dSIAYtSXbToLru97WlqdgnvwUGTpMRvvEK5xog==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwt1sm/Hz04xkvP/mqimIhpgxsWm8Io5gpxZlEOM9B7qFe7Tsy
	CZJ98nXNmyPGTf4Vlp536zWb8NAv2Qtn1evbpvOJw4l46qHHUWPb+CzkCA2dgWM=
X-Gm-Gg: ASbGnctpGEbztDTk36DwnJk+LqEfTeXy0aLhTM6gJoDm8D1CijHDgRcRyjAUZbo3SIX
	3BeV3KR3LzBepu/bKJLd61nmkwlWsKtNEd4sg3u2xQz6NuUwOgisJiwU96yCpEzbWHUFpDYobcD
	hS18P/QCPH1Jv3/O1HuLZ+ZD/JxmfrACUoLu6yjdQ5ILZz1JmX5QCoNMtlTumyR8CdNUyNqFEnz
	8+FT9KiFQK+cWR9l6IzyChqhTHvry+ANzaa5ZJDX1pIlHsBR6UlxZGM9Ix6TqYJQ4abzREgNBh5
	65dnyWNMKbsY8PKjaNbDiM2K/KV3iMwabRbTxiFLpQcWQUrpKAjeVXzo39GL1WukS4siYLozyHT
	97ZQMzDZ2
X-Google-Smtp-Source: AGHT+IFS/pxfjNPDqJhNcLq/lECG72AhDNrlffrBV2L3kxYV1244Sdx32ia+HQiIA8St61CQNBlH4A==
X-Received: by 2002:a05:6e02:b46:b0:3d3:dfc2:912c with SMTP id e9e14a558f8ab-3d483a75837mr164324675ab.17.1742299460874;
        Tue, 18 Mar 2025 05:04:20 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a6683e1sm31287795ab.19.2025.03.18.05.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:04:20 -0700 (PDT)
Message-ID: <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
Date: Tue, 18 Mar 2025 07:04:19 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/25 12:44 AM, Troy Mitchell wrote:
>> I'll leave it up to the maintainer to decide whether these
>> comments can just be ignored--my Reviewed-by is fine, even
>> if you don't change these.
>>
>>                      -Alex
> I know it's right what you said.
> But I don't know if it's worth to send v8?
> Maybe I can fix it when I add FIFO function?
> If I'm wrong, let me know.

Unless the maintainer wants you do do v8, please just
address these suggestions later.  Thank you.

					-Alex
