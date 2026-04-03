Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CD3CD8A2
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233714; cv=none; b=Ion28va1YijbiC4hbR1wkrn+Lrk5ANLy+xKJaa0YAMXVYNEnaOQxBCJXQ6+bVWdXyXXDJpCZmZ4qvz7OAvlcCelgiep90OGTavK1ON2XsM50C5BYahd6EGryfUkvrYjKjNzQxjMlFx1LUoZfo9fjVGiQVKAEq8zwleyaBWtR5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233714; c=relaxed/simple;
	bh=aa2PFgD6i6VfPTSuB5Nzc6oa7i1InOLAX1+UAJ3qULU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nbrBiNpjDjlX6hbzVvR0tEecZGlIWqDGdmktcV96D/7xZ70V7R8rr8TiS4ip6PSLqpuifVoBKYYutcCGM1SgbB/bPsb0sG8zwQPK5sMPKDyCJDCgfHIrlHBq49o4VgnTpPgGAGpOIMf2imX8bpEe6Km6IIQhN5cTtjsyJYnaE24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHK21IAA; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHK21IAA"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-827270d50d4so1873950b3a.3
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775233707; x=1775838507; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJOmOz2L9YVEihHhZLWaE0nc/BZm+kqpkZgh3ChszGk=;
        b=jHK21IAAxQ6xe6Ni+bqctzhYO8SxizmAcWHX76cNuNtuYK4K7jjVlQ8GKXQR3cWkwY
         Zm3gYNfWWNjclMUs3cMXNBGR+DuwQMfQNzHZ7Yt4BwjgUEjwtVWlUjhr34TnW8zLxmxs
         g10XY3Xm5tGy3wVIpVthlj2I6w0AJ1j2hl4oYrJKMDPlay2GHlDfZy58b76rG4L+3HUE
         IMvF8/6+O1JloZM4YeXKfNpKLEG9IwR8g204h3TcV3QqouAELlVHMX+ZHK/GUWW3bJ6l
         dc9mJ5WDg+B5P0eIJaASgIFRDLRAe17DxxkVYKFwvVmmcr287xOjCsEPxpGm20wMhD2O
         QM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233707; x=1775838507;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJOmOz2L9YVEihHhZLWaE0nc/BZm+kqpkZgh3ChszGk=;
        b=W0uQDXVp1Xyw8pd7zgLZdtSdBr3jlvfEChPYUP1sYEgYpIwvX6N36ixYT48G5oP7Ov
         Vl50e/zcvg35hQ+9cBvan7Pcf/EBDUBr7dR9g5wdzOp6Zat8P93gGEw0jmtJxbTvnjbZ
         CHUu1wRffbYFHbVFF8ibYt6flaGgGZV8cUTm4ybgsFg+wSGXL/F/KNlCK5JpTvwc39mW
         AVnLnDJqHRfqM939b4ry/xvt2ohBf9TO1gze6vKl2OlZLK78H9puJuHVBm3OVUbymF+3
         +kyqPsxWfIAkdK3rTMynz1AH8X1yZEJ+9WyfYSbrNdw6TX0tDg55ewMik5YYqM7vvx7l
         W/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUfHxWIcwk6avYjniSEer+5VyADDFd/ht9dLRHWzIE4yrwqIcU5NjGE3bS8RWo+QOyY63VWkd7vRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkHokKn2DHoUKrAFSS0FqGZDLj+ZOXzMstriQSePjYhZLOh4n3
	inxPl7iWW3fxxFb6MU0UPHDPYSvpGwSy3zMATTxCEleiYjrhQVgPLuNF
X-Gm-Gg: AeBDievYsyFgnomxBjSLuUQaIXE1M25HbFJPurHiNsXxQbS808lR3/KPLUH+1heT8Ha
	PS7yyxhSTV4yIs6BzNqVFJ/h4GRQ/K0AXKx/73vjimJI5qj/653+XT/QxzUrFrf7yr1tKSDe2BH
	Zk+w7ELV1FX2pQ/jzFsAhjINlYxLSNyzFg/ZxWYOmeBHBbVDLSU5o23FBbwxmNO1NURmk8zMuUA
	NhpfBYfN5u83saLYObzn4f02LcSHbnlu3B0CPhPyNrrqQnnTQ507B8/P6AxjCptnbQD3KZ6X5Bl
	a+2eRdM8+5YhY3xerJt8COfbokEaO/vZ4F++5BdjyEaZjPvYQZ5nMaPt+L4Cn7hXNtsFwVOeYy7
	ocx1fzOB1KEI51bKM8YieiyYN2YUf8bHBtEzgrpmv5X47xCw+k9sWtP5NfujfiUebPPuFRdkDk3
	bmok5X3E2WCFO5rdmBPPvHjOiTZch2MIWVRF7mAn8C
X-Received: by 2002:a05:6a00:3902:b0:824:a01f:6335 with SMTP id d2e1a72fcca58-82d0daa3ce1mr3501828b3a.22.1775233706143;
        Fri, 03 Apr 2026 09:28:26 -0700 (PDT)
Received: from [10.116.188.94] ([114.254.1.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm6592724b3a.38.2026.04.03.09.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:28:25 -0700 (PDT)
Message-ID: <7792fddc-0218-4889-97c8-42eebadbb343@gmail.com>
Date: Sat, 4 Apr 2026 00:28:17 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Vincent Legoll <legoll@online.fr>, alex@ghiti.fr, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 dlan@gentoo.org, krzk+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, lukasz.luba@arm.com,
 p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
 rafael@kernel.org, robh@kernel.org, rui.zhang@intel.com,
 spacemit@lists.linux.dev
References: <36cca49c-0cb4-42b9-87ae-702df825a4a4@online.fr>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <36cca49c-0cb4-42b9-87ae-702df825a4a4@online.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vincent,

On 4/3/2026 8:57 PM, Vincent Legoll wrote:> Hello,
 >
 >
 > I applied this series on top of:
 >
 > - next-20260402
 >
 > -
 > 
https://patchwork.kernel.org/project/linux-riscv/patch/20260330-orangepi-sd-card-uhs-v5-9-bd853604322d@gmail.com/
 >
 > I need the the SD card series to boot from SD card.
 >
You're absolutely right! We do need the SD series patches.

I'm actually building the mainline kernel using meta-riscv, and it's 
default config
already includes those patches. I completely forgot about that.

Thanks.

 >
 > I'm also seeing the same "it works" state as Gong Shuai.
 >
 > So you can add another:
 >
 > Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
 >
 > Regards
 >
 > Thanks
 >
