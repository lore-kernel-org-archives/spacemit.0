Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2B0392811
	for <spacemit@lists.linux.dev>; Sat, 20 Jun 2026 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781965435; cv=none; b=kA4G4o3P6dQc8QK2AytBXoJvjTxxkfopM1YSMgJL2/heokQelmZad7o9Z7MCjs1uSxjqft2CdU8Q9QVW/WgwM+xsbsHO8fRP8DaxU3bi4xiU6v3xm+P1FcNayv49Zd9c7mdBMF9gGo6EVZbp5eBpghuhYjlFKtMC1N+2AX3sRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781965435; c=relaxed/simple;
	bh=1A3yRBCyiXnf2+7dCdstiNNFsshcbr96SxsOGFDoLtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZxkU233vsAgi3Eg0Yt6XQdRuw2cGRyfsOIS95uf10DS7EfS5L3JEUlge7Iyd9xPXKbSrpaLWAmItKDHrRZzT6WegSx9kSChXyefoRQTiiLII6IUyL//bUH25Pm8NApffM/kWefH1qAt1L3XomgOt3XJlyosyc7Xn0n3xBRRhN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5VCpAIA; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5VCpAIA"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so1433343a91.0
        for <spacemit@lists.linux.dev>; Sat, 20 Jun 2026 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965434; x=1782570234; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2ppqhiXhC3WFA2wZf37Gep+L6TyBObHMBsyL7sziZw=;
        b=l5VCpAIA4n8zogBv7/Uk9jqYUE2bmKfU2SVyLAr3pYvGbaK16k8VQtqeCFnzszALTm
         Lcwppwmn3F/6eAfpmjFI0B3E3CqLo+4Eo2Sb32H271Dc0+N8PplUVEDNVBE+PJAEzWXG
         emwmysq4c0CBGh7FXLadkGX2bxWUzQUAe13khHxACp93HCVoPDB9p+R4ho6mq3ikb75I
         EiyWDPtxiw76BEt7z0LNEmuwIyntQeUY2Rt/RB00mIzCT0Mg/WOvWJx+7H/5qK48jcwz
         2HavHJ0j8doHngXjTrS+AfMKCL2ozsmDmF6w+5WeUJN73Dkns+kmJXB6XsYqZovmgDng
         zjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965434; x=1782570234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ppqhiXhC3WFA2wZf37Gep+L6TyBObHMBsyL7sziZw=;
        b=mJP82s3Lwn15z1ll9Rbm3QiBaaLFj8g8G2Sg4PTb6S/NgOmtObTljZo4Keu3NSVqHG
         N8tyNwELc5DRAAJhQJmqcBWYDs9Y/kY1n7AIDYLzyZtU4ItDm7nlbBXeN8oduaKYqDxC
         M7ghVor/HbS2JJU1GxzMg2qF9dSLg3pW1g3BpmUfg4LyrLDNrMvmkte5SfnFF9GfvAeR
         qfbvMWwJSHuwLbnxphcaLJG4DUPrJnywt/ihY0FqBt72qEByN6BZh+XfMbEMTqoJjXp5
         9s4BK2xtg+b+assfSkaAS2V8/kPj1J3dDpVsjAk43mXDQf260a2qSA54CxDx3M2BF/w0
         zXgA==
X-Forwarded-Encrypted: i=1; AFNElJ8pRP06O2xzxAQSZoZeupJHpYT4EP49P7AQj5VWkqNrPE26iJt85nuJpTgkqaQ8cWHRvdB4Tl4LWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfN7iU3u5xlqBqIcOQXi8i//d5EER15BnTvPy6CH+C6R5KIvl8
	iMT3YktsoH8pBwt85jXAg8aZhIVeVNrBmG95ncVkFiCbvuqW5lAEWUFD
X-Gm-Gg: AfdE7cl6C0ySLCt/2D0+oODxniCvIyd/F+hgQS98NntpQqWoglhH+Cz8hZVv8exxJXi
	98BN3YfloWT+EElF7R5fU10R4Msgk41+5s8x3gYSlTpiMb4SXnUvYrLtFH8r75MaKYhrM3iqpPd
	Z41ii/ihov+698H5gQS4/Ly5WkQj9SbOIo2o7rv8KkgrzdIcHiqx282LFU/XS9LMWbBFDMNL6xA
	Y9PeeQEf0IRuU9YuisuEm1D0WwA2GsT6u8ge31Qy7pOsRJD5c6IHSi92JRUWzShFtL0cJso7ngZ
	2UxFd9pd+bgxp3FxaRl4JdhLK2a5PvqOM8yvhF/iMRGI29GTDv2I+MY/5AvGwPQOUwCZj67VP9H
	hcg6lTVGQVcwcU1qb2o/QMrM74Cor22bvfNcKgwE9xR3e9f6N+ChzARCYlJzr0ZjOtGzHUNmPfw
	VMwZFQJc1psmlRye3S847iUxpKomPw7zosBqm6zIfUB+1o3+aqoNtVQ78I8zbs3Oam
X-Received: by 2002:a05:6a20:6a0f:b0:3b4:7c33:296b with SMTP id adf61e73a8af0-3bb3564431fmr7384251637.32.1781965433512;
        Sat, 20 Jun 2026 07:23:53 -0700 (PDT)
Received: from ?IPV6:240e:304:27f3:cf00:402d:ef5b:4082:aa65? ([240e:304:27f3:cf00:402d:ef5b:4082:aa65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm2556778a12.19.2026.06.20.07.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 07:23:52 -0700 (PDT)
Message-ID: <bae98712-2d0c-4831-8142-bb1318d147b1@gmail.com>
Date: Sat, 20 Jun 2026 22:23:44 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Vincent Legoll <legoll@online.fr>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/2026 5:51 PM, Shuwei Wu wrote:
> This series enables CPU frequency scaling for the SpacemiT K1 SoC.
> 
> K1 has two CPU cluster clocks but one shared CPU voltage rail. Add a
> small K1-specific cpufreq driver so the two clocks and the shared OPP
> transition can be handled together.
> 
> Tested on Banana Pi BPI-F3. The system boots with all eight CPUs online,
> the K1 cpufreq driver registers one policy for CPUs 0-7, and both CPU
> cluster clocks follow the selected cpufreq rate.
> 
> ~ # cat /sys/devices/system/cpu/online
> 0-7
> 
> ~ # ls /sys/devices/system/cpu/cpufreq
> policy0
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
> 0 1 2 3 4 5 6 7
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> With the userspace governor:
> ----------------------------------------------------------------------------
> Frequency    | scaling_cur | cpu_c0_core | cpu_c1_core | Real    | User
> (kHz)        | (kHz)       | (Hz)        | (Hz)        | (s)     | (s)
> -------------+-------------+-------------+-------------+---------+----------
> 1,600,000    | 1,600,000   | 1600000000  | 1600000000  | 1.80s   | 1.80s
> 1,228,800    | 1,228,800   | 1228800000  | 1228800000  | 2.33s   | 2.33s
> 1,000,000    | 1,000,000   | 1000000000  | 1000000000  | 2.88s   | 2.87s
>    819,000    |   819,000   |  819200000  |  819200000  | 3.53s   | 3.52s
>    614,400    |   614,400   |  614400000  |  614400000  | 4.72s   | 4.72s
> ----------------------------------------------------------------------------
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org
> 
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>        cpufreq: spacemit: Add K1 cpufreq driver
>        riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++-
>   arch/riscv/boot/dts/spacemit/k1-opp.dtsi        |  70 +++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 +
>   drivers/cpufreq/Kconfig                         |   4 +
>   drivers/cpufreq/Kconfig.riscv                   |  15 ++
>   drivers/cpufreq/Makefile                        |   3 +
>   drivers/cpufreq/cpufreq-dt-platdev.c            |   2 +
>   drivers/cpufreq/spacemit-k1-cpufreq.c           | 251 ++++++++++++++++++++++++
>   8 files changed, 387 insertions(+), 1 deletion(-)
> ---
> base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
> change-id: 20260307-shadow-deps-3582a78aa756
> prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e
> prerequisite-message-id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
> prerequisite-patch-id: 5da3e75b18291a5540d4f66d7a0600fb8975ef62
> prerequisite-patch-id: bcf41917414ecef8cf743095d130f6004c32f6a5
> prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
> prerequisite-message-id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
> prerequisite-patch-id: 7c7fb9f87dba019ece4c97c45750349a7cd28f3a
> 
> Best regards,


Hi Shuwei and Vincent,

I have tested this series on the OrangePi RV2 board (4GB) on top of
linux-next (next-20260619), with the v3 cpufreq series and Vincent's
patch "k1-orangepi-rv2: Add cpu scaling" applied.

The driver works as expected: all 8 CPUs are online and share a single
policy (policy0). Writing to
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
correctly changes the frequency for all cores simultaneously, and all
scaling_setspeed files show the same value. The frequency transitions
are smooth, and performance (tested with a simple awk loop, following
Vincent's approach) scales linearly with the set frequency.

Both of you can add my tag:

Tested-by: Gong Shuai <gsh517025@gmail.com> # OrangePi-RV2

If you send a new version, I'm also willing to test it again.

Thanks for the work.

Regards,
Shuai


