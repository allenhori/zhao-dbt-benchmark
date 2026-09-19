select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v7, 0) + 13 as v1,
    p.v1 * 7 as v2,
    case when p.v7 > 1300 then p.v7 else 0 end as v3,
    round(p.v7 / 7.0, 4) as v4,
    p.v1 + p.v7 as v5,
    p.v7 + 11 as v6
from {{ ref('int_ev_0189') }} as p
